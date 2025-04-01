import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box2_buttons.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_livery_status_display.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';
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
                radius: 30.r,
                backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
                ),
              ),
              AppSize.sizedBox2h,
              BlocConsumer<ProfileBloc, ProfileState>(
                listenWhen:
                    (p, c) => p.getProfileRes.status != c.getProfileRes.status,
                buildWhen:
                    (p, c) => p.getProfileRes.status != c.getProfileRes.status,
                listener: (context, state) {
                  final res = state.getProfileRes;
                  if (res.status == ApiStatus.success) {
                    violationPop(context, count: res.apiData?.violationCount);
                  }
                },
                builder: (context, state) {
                  customPrint('BLOC BUILDER - PROFILE SCREEN');
                  ProfileModel? data = state.getProfileRes.apiData;
                  return Column(
                    spacing: 05,
                    children: [
                      WwText(
                        text: data?.username ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if ((data?.violationCount ?? 0) > 0)
                        InkWell(
                          onTap: () {
                            violationPop(context, count: data?.violationCount);
                          },
                          child: WwText(
                            text: 'Account Warning',
                            style: TextStyle(
                              color: Colors.red[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
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
              ListTile(
                leading: Icon(Icons.person),
                title: WwText(text: 'Liked Profiles'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  context.router.push(ProfileListRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.download_for_offline_outlined),
                title: WwText(text: 'Downloads'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  context.router.push(LiveryDownloadsRoute());
                },
              ),
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
              ListTile(
                leading: Icon(Icons.remove_circle_outline_outlined),
                title: WwText(text: 'Deactivate Account'),
                onTap: () {
                  wwDialogueBox2Button(
                    context,
                    text: 'Account Deactivation',
                    textSub: '''
Your account is scheduled for deactivation and will be permanently removed after 45 days.

During this period, you can reactivate your account by logging in. After 45 days, your data will be permanently deleted and cannot be recovered.

''',
                    secondTap: () {
                      getIt<SharedPrefService>().clear();
                      context.router.replaceAll([LoginRoute()]);
                    },
                  );
                },
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
    return BlocSelector<ProfileBloc, ProfileState, List<LiveryModel>>(
      selector: (state) => state.getMyLiveryRes.apiData ?? [],
      builder: (context, state) {
        return WWResponseHandler(
          data: bloc.state.getMyLiveryRes,
          isEmpty: state.isEmpty,
          apiCall: () async => bloc.add(GetMyLiveryApiEvent()),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: state.length,
            itemBuilder: (c, i) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: state[i].postImage?.liveryImage200 ?? '',
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                  if (state[i].approvalStatus ==
                      ApprovalStatus.rejected.name) ...[
                    liverShade,
                    WwLiveryRejected(),
                  ],
                  if (state[i].approvalStatus ==
                      ApprovalStatus.waiting.name) ...[
                    liverShade,
                    WwLiveryWaiting(),
                  ],
                ],
              );
            },
          ),
        );
      },
    );
  }
}

void violationPop(BuildContext context, {int? count}) {
  late String subtitle;

  if (count == 1) {
    subtitle =
        'We noticed that your recent post violates our community guidelines. Please ensure your content aligns with our policies. Continued violations may lead to restrictions on your account. Warnings will reset after 30 days if no further violations occur.';
  } else if (count == 2) {
    subtitle =
        'This is your second warning regarding inappropriate content. Please review our community guidelines to avoid penalties. Another violation may result in temporary account suspension. If you maintain compliance for 30 days, warnings will reset.';
  } else if (count == 3) {
    subtitle =
        'This is your final warning. If another violation occurs, your account may be suspended. Please ensure all content follows our guidelines. If no further violations occur, warnings will reset after 30 days';
  } else {
    subtitle = '';
  }

  if ((count ?? 0) > 0) {
    wwDialogueBox(
      context,
      barrierDismissible: false,
      text: 'Content Violation Notice',
      textSub: subtitle,
    );
  }
}
