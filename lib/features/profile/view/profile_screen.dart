import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/router/router_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.swPadding,
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
                ),
              ),
              AppSize.sizedBox2h,
              BlocSelector<ProfileBloc, ProfileState, String>(
                selector:
                    (state) => state.getProfileRes.apiData?.username ?? '',
                builder: (context, username) {
                  return WwText(
                    text: username,
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
              ),
              AppSize.sizedBox2h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WwText(
                          text: '29',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const WwText(text: 'Posts'),
                      ],
                    ),
                  ),
                  // AppSize.sizedBox2w,
                  SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  // AppSize.sizedBox2w,
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocSelector<ProfileBloc, ProfileState, int>(
                          selector:
                              (state) =>
                                  state.getProfileRes.apiData?.likeCount ?? 0,
                          builder: (context, likeCount) {
                            return WwText(
                              text: likeCount.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            );
                          },
                        ),
                        const WwText(text: 'Likes'),
                      ],
                    ),
                  ),
                ],
              ),
              AppSize.sizedBox2h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WWButton(
                    expandFlex: 1,
                    text: 'Edit Profile',
                    onPressed: () {
                      context.router.pushPath(RouterNames.editProfileScreen);
                    },
                  ),
                  AppSize.sizedBox2w,
                  WWButton(
                    expandFlex: 1,
                    text: 'More',
                    onPressed: () {
                      _profileModeOptions(context);
                    },
                  ),
                ],
              ),
              AppSize.sizedBox2h,
              Align(
                alignment: Alignment.topLeft,
                child: WwText(
                  text: 'Posts',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              AppSize.sizedBox2h,
              Flexible(child: _ProfileGallery(bloc: bloc)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _profileModeOptions(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppSize.sizedBox3h,
              const ListTile(
                leading: Icon(Icons.security),
                title: WwText(text: 'Privacy'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              const ListTile(
                leading: Icon(Icons.privacy_tip),
                title: WwText(text: 'Terms & Condition'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              const ListTile(
                leading: Icon(Icons.remove_circle_outline_outlined),
                title: WwText(text: 'Deactivate Account'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: WwText(text: 'Sign out'),
                onTap: () {
                  getIt<SharedPrefService>().clear();
                  context.router.replaceAll([LoginRoute()]);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileGallery extends StatelessWidget {
  final ProfileBloc bloc;
  const _ProfileGallery({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, List<LiveryModel>?>(
      selector: (state) => state.getMyLiveryRes.apiData,
      builder: (context, state) {
        return WWResponseHandler(
          data: bloc.state.getMyLiveryRes,
          isEmpty: state?.isEmpty,
          apiCall: () async => bloc.add(GetMyLiveryApiEvent()),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: state?.length ?? 0,
            itemBuilder: (c, i) {
              return CachedNetworkImage(
                width: double.infinity,
                imageUrl: state![i].postImage?.livertImage600 ?? '',
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
