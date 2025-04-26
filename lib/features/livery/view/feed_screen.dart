import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cfeature/report/widget/ww_report_content.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_livery_status_display.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/livery_styles.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/extensions.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/styles.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:livery/service/ad_service.dart';
import 'package:livery/utils/di/injection.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/buss_logo.png', height: 70),
        actions: [gridViewToggle(context), filterOptions(context)],
      ),
      body: Padding(
        padding: AppSize.swPadding,
        child: Column(
          children: [
            // Upload progress indicator
            BlocSelector<LiveryBloc, LiveryState, Map<String, bool>>(
              selector: (state) => state.uploadsInProgress,
              builder: (context, uploadsInProgress) {
                if (uploadsInProgress.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: WwText(
                          text: 'Uploading livery design...',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      WwText(
                        text: '${uploadsInProgress.length} in progress',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Main content
            Expanded(
              child: BlocBuilder<LiveryBloc, LiveryState>(
                buildWhen:
                    (p, c) =>
                        p.getAllLiveryRes.status != c.getAllLiveryRes.status ||
                        p.gridColumns != c.gridColumns,
                builder: (context, state) {
                  customPrint('BLOC BUILDER - FeedScreen');
                  List<LiveryModel>? liveryData =
                      state.getAllLiveryRes.apiData?.data;
                  return WWResponseHandler(
                    data: state.getAllLiveryRes,
                    apiCall: () async {
                      context.read<LiveryBloc>().add(GetAllLiveryApiEvent());
                    },
                    isEmpty: liveryData?.isEmpty ?? true,
                    child:
                        state.gridColumns == 1
                            ? ListView.separated(
                              separatorBuilder:
                                  (context, index) => AppSize.sizedBox1h,
                              itemCount: liveryData?.length ?? 0,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return PostWidget(
                                  index: index,
                                  bloc: bloc,
                                  data: liveryData![index],
                                );
                              },
                            )
                            : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: state.gridColumns,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                              itemCount: liveryData?.length ?? 0,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return GridItemWidget(
                                  index: index,
                                  bloc: bloc,
                                  data: liveryData![index],
                                );
                              },
                            ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridViewToggle(BuildContext context) {
    return BlocSelector<LiveryBloc, LiveryState, int>(
      selector: (state) => state.gridColumns,
      builder: (context, gridColumns) {
        return IconButton(
          onPressed: () {
            // Toggle between 1 (list) and 2 (grid)
            final newColumns = gridColumns == 1 ? 2 : 1;
            context.read<LiveryBloc>().add(
              ToggleGridViewEvent(columns: newColumns),
            );
          },
          icon: Icon(
            gridColumns == 1 ? Icons.grid_view : Icons.view_list,
            color: AppColors.primary,
          ),
          tooltip: gridColumns == 1 ? 'Grid View' : 'List View',
        );
      },
    );
  }

  IconButton filterOptions(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bloc = context.read<LiveryBloc>();

        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: BlocSelector<LiveryBloc, LiveryState, LiveryFilter>(
                selector: (state) => state.filter,
                builder: (context, state) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AppSize.sizedBox3h,
                      ListTile(
                        leading: Icon(Icons.new_label_outlined),
                        title: WwText(text: 'Latest'),
                        onTap: () {
                          bloc.add(
                            FilterLiveryEvent(filter: LiveryFilter.latest),
                          );
                        },
                        trailing: Checkbox(
                          value: state == LiveryFilter.latest,
                          onChanged: (v) {
                            bloc.add(
                              FilterLiveryEvent(filter: LiveryFilter.latest),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.download_for_offline_outlined),
                        title: WwText(text: 'Most Downloaded'),
                        onTap: () {
                          bloc.add(
                            FilterLiveryEvent(
                              filter: LiveryFilter.mostDownloaded,
                            ),
                          );
                        },
                        trailing: Checkbox(
                          value: state == LiveryFilter.mostDownloaded,
                          onChanged: (v) {
                            bloc.add(
                              FilterLiveryEvent(
                                filter: LiveryFilter.mostDownloaded,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.filter_alt_outlined, color: AppColors.primary),
    );
  }
}

class PostWidget extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  final int index;
  const PostWidget({
    super.key,
    required this.data,
    required this.bloc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                postOwnerDetail(
                  context,
                  data: data,
                ), // POST OWNER DETAIL ----------
                //
                Row(
                  children: [
                    postDownload(),
                    _MoreOptons(context, bloc: bloc, data: data),
                  ],
                ),
              ],
            ),
          ),
          //
          postImage(context), // POST IMAGE --------------------------------
          //
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                WwText(
                  text: data.liveryName ?? '',
                  style: LiveryStyles.liveryName(),
                ),
                AppSize.sizedBox1h,
                //
                if (data.description?.isNotEmpty ?? false)
                  WwText(
                    text: data.description ?? '',
                    style: LiveryStyles.description(),
                  ),
                AppSize.sizedBox1h,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget postDownload() {
    return BlocSelector<LiveryBloc, LiveryState, int?>(
      selector: (state) {
        return state.getAllLiveryRes.apiData?.data?[index].downloadCount;
      },
      builder: (context, count) {
        customPrint('BLOC BUILDER - postDownload');
        return IconButton(
          onPressed: () async {
            final adService = getIt<AdService>();

            await downloadAndSaveImageWithDio(bloc, data);
            // Check if this is the first download (show rewarded video ad)
            if (adService.isFirstDownload()) {
              // Show rewarded ad for the first download
              final bool wasAdCompleted = await adService.showRewardedAd();
              if (wasAdCompleted) {
                // Download the livery after watching the ad
              }
            } else {
              // Not first download - download first, then show interstitial
              // Show interstitial ad after downloading
              await adService.showInterstitialAd();
            }
          },
          icon: Row(
            children: [
              WwText(text: count?.toString() ?? '', style: normalText()),
              SizedBox(width: 05),
              Icon(Icons.downloading_outlined),
            ],
          ),
        );
      },
    );
  }

  ClipRRect postImage(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              width: double.infinity,
              imageUrl: data.postImage?.liveryImage1080 ?? '',
              fit: BoxFit.cover,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget:
                  (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.primary),
            ),
            if (data.approvalStatus == ApprovalStatus.waiting.name) ...[
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: liverShade,
              ),
              WwLiveryWaiting(),
            ],
          ],
        ),
      ),
    );
  }

  InkWell postOwnerDetail(BuildContext context, {required LiveryModel data}) {
    return InkWell(
      onTap: () {
        context.router.push(OtherProfileRoute(profileData: data.user));
      },
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
            ),
          ),
          AppSize.sizedBox2w,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WwText(
                text: data.user?.username ?? '--',
                style: LiveryStyles.profileName(),
              ),
              WwText(
                text: data.createdAt?.displayDDMMYY() ?? '',
                style: LiveryStyles.date(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MoreOptons extends StatelessWidget {
  final BuildContext context;
  final LiveryBloc bloc;
  final LiveryModel data;
  const _MoreOptons(this.context, {required this.bloc, required this.data});

  @override
  Widget build(BuildContext context) {
    customPrint(key);
    return BlocConsumer<LiveryBloc, LiveryState>(
      buildWhen: (p, c) {
        return p.deleteLiveryRes.status != c.deleteLiveryRes.status &&
            c.deleteLiveryRes.key == data.id;
      },
      listenWhen: (p, c) {
        return p.deleteLiveryRes.status != c.deleteLiveryRes.status &&
            c.deleteLiveryRes.key == data.id;
      },
      listener: (context, state) {
        if (state.deleteLiveryRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.deleteLiveryRes.errorMessage);
        }

        if (state.deleteLiveryRes.status == ApiStatus.success) {
          showSuccessToast(message: state.deleteLiveryRes.successMessage);
        }
      },
      builder: (context, deleteStatus) {
        customPrint('LIVERY BLOC BUILDER - _MoreOptons');
        return deleteStatus.deleteLiveryRes.status == ApiStatus.loading
            ? CupertinoActivityIndicator()
            : buildMoreOptions(context, data);
      },
    );
  }
}

IconButton buildMoreOptions(BuildContext context, LiveryModel data) {
  final liveryBloc = context.read<LiveryBloc>();

  return IconButton(
    onPressed: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppSize.sizedBox3h,
                ListTile(
                  leading: Icon(Icons.edit),
                  title: WwText(text: 'Edit Livery'),
                  onTap: () {
                    context.router.push(LiveryCreateRoute(data: data));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.report),
                  title: WwText(text: 'Report Livery'),
                  onTap: () {
                    showBottomSheet(context, data);
                    // context.router.maybePop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: WwText(text: 'Delete Livery'),
                  onTap: () {
                    context.router.maybePop();
                    liveryBloc.add(DeleteLiveryApiEvent(liveryId: data.id!));
                  },
                ),
              ],
            ),
          );
        },
      );
    },
    icon: const Icon(Icons.more_horiz, color: AppColors.primary),
  );
}

showBottomSheet(BuildContext context, LiveryModel data) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext _) {
      return WwReportContent(
        context,
        contentId: data.id,
        type: ReportType.livery,
      );
    },
  );
}

Future<void> downloadAndSaveImageWithDio(
  LiveryBloc bloc,
  LiveryModel data,
) async {
  try {
    bloc.add(DownloadLiveryApiEvent(liveryId: data.id));

    final imageUrl = data.postImage?.liveryImageOriginal;

    if (imageUrl == null || imageUrl.isEmpty) {
      throw Exception("Image URL is empty");
    }

    final status = await Permission.photos.request(); // For Android 13+
    final storageStatus = await Permission.storage.request();

    if (!status.isGranted && !storageStatus.isGranted) {
      throw Exception("Permission denied");
    }

    final response = await Dio().get<List<int>>(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data!),
      quality: 100,
      name: "livery_${DateTime.now().millisecondsSinceEpoch}",
    );

    if (result['isSuccess']) {
      showSuccessToast(message: 'File downloaded to gallery');
      customPrint("Saved to gallery: ${result['filePath']}");
    } else {
      throw Exception("Failed to save image");
    }
  } catch (e) {
    customPrint("Error downloading or saving file: $e");
  }
}

class GridItemWidget extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  final int index;

  const GridItemWidget({
    super.key,
    required this.data,
    required this.bloc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Show full post details
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: PostWidget(index: index, bloc: bloc, data: data),
                    );
                  },
                );
              },
              child: CachedNetworkImage(
                imageUrl: data.postImage?.liveryImage200 ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          // Title and Actions
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Livery name
                WwText(
                  text: data.liveryName ?? '',
                  style: LiveryStyles.liveryName(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4),

                // Owner name
                if (data.user?.username != null)
                  WwText(
                    text: 'by ${data.user?.username}',
                    style: LiveryStyles.profileName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                SizedBox(height: 4),

                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Downloads count
                    Row(
                      children: [
                        Icon(Icons.download_outlined, size: 16),
                        SizedBox(width: 4),
                        WwText(
                          text: '${data.downloadCount ?? 0}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    // More options
                    buildMoreOptions(context, data),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
