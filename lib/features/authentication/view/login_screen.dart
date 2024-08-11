import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_buttons.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/common_widgets/ww_textfield.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSize.swPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 50),
              AppSize.sizedBox4h,
              WWTextField(
                  controller: TextEditingController(),
                  hintText: 'Enter your email'),
              AppSize.sizedBox2h,
              WWButton(
                text: 'Get OTP',
                onPressed: () {},
                color: appColors.cPrimary,
              ),
              AppSize.sizedBox4h,
              Row(
                children: [
                  Flexible(child: Divider(color: appColors.cGrey)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: WwText(text: 'Or Connect with'),
                  ),
                  Flexible(child: Divider(color: appColors.cGrey)),
                ],
              ),
              AppSize.sizedBox4h,
              WWButton(
                text: 'Google Sign In',
                // icon: Icons.stop_circle_sharp,
                onPressed: () {},
                color: appColors.cPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
