import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/horn/application/horn_bloc.dart';
import 'package:livery/features/horn/model/horn_model.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';

class HornListItem extends StatefulWidget {
  final HornModel horn;

  const HornListItem({super.key, required this.horn});

  // Shared static player and notifier to sync audio playback across all items
  static final AudioPlayer globalPlayer = AudioPlayer();
  static final ValueNotifier<int?> playingHornIdNotifier = ValueNotifier<int?>(
    null,
  );

  @override
  State<HornListItem> createState() => _HornListItemState();
}

class _HornListItemState extends State<HornListItem> {
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  PlayerState _playerState = PlayerState.stopped;
  bool _isPlayerActionLoading = false;

  StreamSubscription? _positionSub;
  StreamSubscription? _durationSub;
  StreamSubscription? _stateSub;

  @override
  void initState() {
    super.initState();
    // Sync states when this specific widget is the active playing horn
    HornListItem.playingHornIdNotifier.addListener(_onActiveHornChanged);
  }

  void _onActiveHornChanged() {
    if (HornListItem.playingHornIdNotifier.value == widget.horn.id) {
      _subscribeToPlayer();
    } else {
      _unsubscribeFromPlayer();
      setState(() {
        _position = Duration.zero;
        _duration = Duration.zero;
        _playerState = PlayerState.stopped;
      });
    }
  }

  void _subscribeToPlayer() {
    _unsubscribeFromPlayer();

    _positionSub = HornListItem.globalPlayer.onPositionChanged.listen(
      (p) {
        if (mounted) setState(() => _position = p);
      },
      onError: (e) {
        customPrint("AudioPlayer position stream error: $e");
      },
    );

    _durationSub = HornListItem.globalPlayer.onDurationChanged.listen(
      (d) {
        if (mounted) setState(() => _duration = d);
      },
      onError: (e) {
        customPrint("AudioPlayer duration stream error: $e");
      },
    );

    _stateSub = HornListItem.globalPlayer.onPlayerStateChanged.listen(
      (s) {
        if (mounted) setState(() => _playerState = s);
      },
      onError: (e) {
        customPrint("AudioPlayer state stream error: $e");
      },
    );

    // Capture initial duration if player has it
    try {
      HornListItem.globalPlayer.getDuration().then((d) {
        if (mounted && d != null) {
          setState(() => _duration = d);
        }
      }).catchError((e) {
        customPrint("Error getting duration asynchronously: $e");
      });
    } catch (e) {
      customPrint("Error calling getDuration: $e");
    }
  }

  void _unsubscribeFromPlayer() {
    try {
      _positionSub?.cancel();
      _durationSub?.cancel();
      _stateSub?.cancel();
    } catch (e) {
      customPrint("Error canceling player subscriptions: $e");
    }
  }

  Future<void> _togglePlay() async {
    if (_isPlayerActionLoading) return;
    if (widget.horn.audioPath.isEmpty) {
      showSuccessToast(message: 'Audio path is not available');
      return;
    }

    setState(() => _isPlayerActionLoading = true);

    try {
      final activeId = HornListItem.playingHornIdNotifier.value;
      if (activeId == widget.horn.id) {
        if (_playerState == PlayerState.playing) {
          await HornListItem.globalPlayer.pause();
        } else {
          await HornListItem.globalPlayer.resume();
        }
      } else {
        // Stop currently playing
        await HornListItem.globalPlayer.stop();
        // Set active horn ID
        HornListItem.playingHornIdNotifier.value = widget.horn.id;
        // Play new source
        await HornListItem.globalPlayer.play(UrlSource(widget.horn.audioPath));
      }
    } catch (e) {
      customPrint("AudioPlayer playback error: $e");
      showSuccessToast(message: 'Unable to play this audio file');
    } finally {
      if (mounted) {
        setState(() => _isPlayerActionLoading = false);
      }
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    HornListItem.playingHornIdNotifier.removeListener(_onActiveHornChanged);
    _unsubscribeFromPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: HornListItem.playingHornIdNotifier,
      builder: (context, activeHornId, child) {
        final isCurrent = activeHornId == widget.horn.id;
        final isPlaying = isCurrent && _playerState == PlayerState.playing;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isCurrent
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.5)
                  : Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: User Info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage:
                          widget.horn.user?.dp != null &&
                              widget.horn.user!.dp!.isNotEmpty
                          ? NetworkImage(widget.horn.user!.dp!)
                          : const NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
                            ),
                    ),
                    AppSize.sizedBox2w,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WwText(
                            text: widget.horn.user?.username ?? 'Anonymous',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (widget.horn.createdAt != null)
                            WwText(
                              text: widget.horn.createdAt!
                                  .toIso8601String()
                                  .substring(0, 10),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                        ],
                      ),
                    ),
                    // Approval Status or Download Button
                    if (widget.horn.approvalStatus == 'waiting')
                      IconButton(
                        onPressed: () {
                          wwDialogueBox(
                            context,
                            text: 'Pending',
                            textSub:
                                'Waiting for administrator review and approval.',
                          );
                        },
                        icon: Icon(
                          Icons.timelapse_sharp,
                          size: 26.sp,
                          color: Colors.amber[400],
                        ),
                      )
                    else if (widget.horn.approvalStatus == 'rejected')
                      IconButton(
                        onPressed: () {
                          wwDialogueBox(
                            context,
                            text: 'Rejected',
                            textSub:
                                'We noticed that your recent post violates our community guidelines.',
                          );
                        },
                        icon: Icon(
                          Icons.error_outline_outlined,
                          size: 26.sp,
                          color: Colors.red[400],
                        ),
                      )
                    else
                      BlocBuilder<HornBloc, HornState>(
                        builder: (context, state) {
                          final isDownloading =
                              state.downloadsInProgress[widget.horn.id] ??
                              false;

                          if (isDownloading) {
                            return SizedBox(
                              width: 24.w,
                              height: 24.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                          }

                          return IconButton(
                            icon: Icon(
                              Icons.download_for_offline_outlined,
                              size: 26.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {
                              context.read<HornBloc>().add(
                                DownloadHornEvent(horn: widget.horn),
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
                AppSize.sizedBox1h,

                // Body: Title & Description
                WwText(
                  text: widget.horn.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.horn.description != null &&
                    widget.horn.description!.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  WwText(
                    text: widget.horn.description!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                AppSize.sizedBox2h,

                // Audio Playback Controls
                Row(
                  children: [
                    IconButton(
                      iconSize: 36.sp,
                      color: Theme.of(context).colorScheme.primary,
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                      ),
                      onPressed: _togglePlay,
                    ),
                    Expanded(
                      child: isCurrent
                          ? SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 3.h,
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 6.r,
                                ),
                                overlayShape: RoundSliderOverlayShape(
                                  overlayRadius: 12.r,
                                ),
                              ),
                              child: Slider(
                                value: _position.inMilliseconds.toDouble(),
                                min: 0.0,
                                max: _duration.inMilliseconds.toDouble() > 0.0
                                    ? _duration.inMilliseconds.toDouble()
                                    : 1.0,
                                onChanged: (value) async {
                                  try {
                                    await HornListItem.globalPlayer.seek(
                                      Duration(milliseconds: value.toInt()),
                                    );
                                  } catch (e) {
                                    customPrint("AudioPlayer seek error: $e");
                                  }
                                },
                              ),
                            )
                          : SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 3.h,
                                thumbShape: SliderComponentShape.noThumb,
                              ),
                              child: Slider(
                                value: 0,
                                min: 0,
                                max: 1,
                                onChanged: null,
                              ),
                            ),
                    ),
                    SizedBox(width: 8.w),
                    WwText(
                      text: isCurrent
                          ? '${_formatDuration(_position)} / ${_formatDuration(_duration)}'
                          : widget.horn.duration != null
                          ? _formatDuration(
                              Duration(
                                milliseconds: (widget.horn.duration! * 1000)
                                    .toInt(),
                              ),
                            )
                          : '00:00',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
