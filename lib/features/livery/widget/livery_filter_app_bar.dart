import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';

class LiveryFilterAppBar extends StatelessWidget {
  const LiveryFilterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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

                      // LATEST LIVERY
                      CheckboxListTile(
                        value: state == LiveryFilter.latest,
                        onChanged: (v) {
                          bloc.add(
                            FilterLiveryEvent(filter: LiveryFilter.latest),
                          );
                        },
                        title: WwText(text: 'Latest'),
                        secondary: Icon(Icons.new_label_outlined),
                      ),

                      // MOST DOWNLOADED LIVERY
                      CheckboxListTile(
                        value: state == LiveryFilter.mostDownloaded,
                        onChanged: (v) {
                          bloc.add(
                            FilterLiveryEvent(
                              filter: LiveryFilter.mostDownloaded,
                            ),
                          );
                        },
                        title: WwText(text: 'Most Downloaded'),
                        secondary: Icon(Icons.download_for_offline_outlined),
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
