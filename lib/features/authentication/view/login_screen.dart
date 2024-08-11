import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_buttons.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/common_widgets/ww_textfield.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/app_theme.dart';
import 'package:svg_flutter/svg.dart';

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
              ),
              AppSize.sizedBox4h,
              Row(
                children: [
                  Flexible(child: Divider(color: appColors.cGrey)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: WwText(text: 'Or connect with'),
                  ),
                  Flexible(child: Divider(color: appColors.cGrey)),
                ],
              ),
              AppSize.sizedBox4h,
              WWButton(
                text: 'Continue with Google',
                preffixIcon: SvgPicture.asset(
                  'assets/svg/google.svg',
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
