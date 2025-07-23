import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_livery_status_display.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/livery_styles.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/widget/download_livery_save.dart';
import 'package:livery/features/livery/widget/livery_more_options.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/extensions.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/styles.dart';

class LiveryListView extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  final int index;
  const LiveryListView({
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
                    LiveryMoreOptions(bloc: bloc, data: data),
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
            await downloadAndSaveImageWithDio(bloc, data);
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
