import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/common_widgets/ww_buttons.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/utils/app_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const channel = MethodChannel("livery_channel");

    String? message;

    void showToast() async {
      try {
        print("Method Triggered");
        message =
            await channel.invokeMethod("livery", {"message": "hello flutter"});
        print(message);
      } on PlatformException catch (_) {
        print(_);
      } on MissingPluginException catch (_) {
        print("plugin error : $_");
      } catch (e) {
        // print(e);
      }
    }

    const platform = MethodChannel('com.example/file_opener');

    Future<void> openPdf(String filePath) async {
      try {
        await platform.invokeMethod('openPdf', {'filePath': filePath});
      } on PlatformException catch (e) {
        print("Failed to open PDF: '${e.message}'.");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.swPadding,
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: const NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s'),
              ),
              AppSize.sizedBox2h,
              WwText(
                  text: 'Jithin Johnson',
                  test: TextStyles.heading,
                  style: Theme.of(context).textTheme.titleLarge),
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
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest),
                  ),
                  // AppSize.sizedBox2w,
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WwText(
                          text: '1000',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const WwText(text: 'Downloads'),
                      ],
                    ),
                  ),
                ],
              ),
              AppSize.sizedBox2h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: WWButton(
                          text: message ?? 'Edit Profile',
                          onPressed: () {
                            openPdf('');
                            // showToast();
                          })),
                  AppSize.sizedBox2w,
                  Expanded(
                      child: WWButton(
                          text: 'More',
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
                                        leading: Icon(Icons.security),
                                        title: WwText(text: 'Privacy'),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.privacy_tip),
                                        title:
                                            WwText(text: 'Terms & Condition'),
                                        trailing: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons
                                            .remove_circle_outline_outlined),
                                        title:
                                            WwText(text: 'Deactivate Account'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.logout),
                                        title: WwText(text: 'Sign out'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          })),
                ],
              ),
              AppSize.sizedBox2h,
              Align(
                  alignment: Alignment.topLeft,
                  child: WwText(
                    text: 'Posts',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
              AppSize.sizedBox2h,
              Flexible(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: 20,
                    itemBuilder: (c, i) {
                      return CachedNetworkImage(
                        width: double.infinity,
                        imageUrl:
                            "https://i.pinimg.com/736x/09/a6/d6/09a6d6ff2a65445a72fbf91c746e6dfd.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
