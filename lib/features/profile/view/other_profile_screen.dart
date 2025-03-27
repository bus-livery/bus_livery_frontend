import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cfeature/report/widget/ww_report_content.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cwidgets/pop_up_menu/profile_menus.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/features/profile/profile_styles.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/styles.dart';

@RoutePage()
class OtherProfileScreen extends StatelessWidget {
  final ProfileModel? profileData;
  const OtherProfileScreen({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    showBottomSheet() {
      return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext _) {
          return WwReportContent(
            context,
            contentId: profileData?.id,
            type: ReportType.profile,
          );
        },
      );
    }

    return Scaffold(
      appBar: WwAppBar(
        title: profileData?.username ?? '',
        centerTitle: false,
        actions: [WwProfileMenus(reportTap: () => showBottomSheet())],
      ),

      body: Padding(
        padding: AppSize.swPadding,
        child: Column(
          spacing: 10,
          children: [
            _ProfileDetail(bloc: bloc, profileData: profileData),
            WWButton(
              text: 'Like Profile',
              onPressed: () {
                // context.router.pushPath(RouterNames.editProfileScreen);
              },
            ),

            Flexible(
              child: _ProfileGallery(bloc: bloc, profileData: profileData),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileDetail extends StatelessWidget {
  final ProfileBloc bloc;
  const _ProfileDetail({required this.profileData, required this.bloc});

  final ProfileModel? profileData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: AppColors.primary),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30.r,
              backgroundImage: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
              ),
            ),
          ),
        ),
        Column(
          children: [
            WwText(text: 'Likes', style: normalText()),

            WwText(
              text: profileData?.likeCount?.toString() ?? '_',
              style: ProfileStyles.count(),
            ),
          ],
        ),
        Column(
          children: [
            WwText(text: 'Livery', style: normalText()),
            WwText(text: '100', style: ProfileStyles.count()),
          ],
        ),
      ],
    );
  }
}

class _ProfileGallery extends StatelessWidget {
  final ProfileBloc bloc;
  final ProfileModel? profileData;
  const _ProfileGallery({required this.bloc, this.profileData});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      ProfileBloc,
      ProfileState,
      ApiResponse<List<LiveryModel>>
    >(
      selector: (state) => state.getOthersLiveryRes,
      builder: (context, state) {
        return WWResponseHandler(
          data: state,
          isEmpty: state.apiData?.isEmpty,
          apiCall:
              () async => bloc.add(
                GetOthersLiveryApiEvent(userId: profileData?.id ?? 0),
              ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: state.apiData?.length ?? 0,
            itemBuilder: (c, i) {
              var data = state.apiData![i];
              return CachedNetworkImage(
                width: double.infinity,
                imageUrl: data.postImage?.liveryImage200 ?? '',
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
        );
      },
    );
  }
}
