import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_buttons.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/common_widgets/ww_textfield.dart';
import 'package:livery/features/authentication/view/otp_screen.dart';
import 'package:livery/utils/app_size.dart';
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
              Image.asset('assets/images/buss_logo.png', height: 150),
              WWTextField(
                  controller: TextEditingController(),
                  hintText: 'Enter your email'),
              AppSize.sizedBox2h,
              WWButton(
                text: 'Get OTP',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OtpScreen(),
                    ),
                  );
                },
              ),
              AppSize.sizedBox4h,
              Row(
                children: [
                  Flexible(
                      child: Divider(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: WwText(text: 'Or connect with'),
                  ),
                  Flexible(
                      child: Divider(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest)),
                ],
              ),
              AppSize.sizedBox4h,
              WWButton(
                text: 'Continue with Google',
                preffixIcon: SvgPicture.asset(
                  'assets/svg/google.svg',
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
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
