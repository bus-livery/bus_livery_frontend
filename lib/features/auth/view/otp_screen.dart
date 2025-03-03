import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_buttons.dart';
import 'package:livery/common_widgets/ww_pin_code_text_field.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/main_screen.dart';
import 'package:livery/utils/app_size.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSize.swPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WwText(
                  text: 'Verification',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              AppSize.sizedBox4h,
              WwText(
                  text: 'Enter the code sent to the email',
                  style: Theme.of(context).textTheme.bodyMedium),
              AppSize.sizedBox2h,
              WwText(
                  text: 'iamjithinjohnson@gmail.com',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              AppSize.sizedBox6h,
              WWPinCodeTextField(
                  context: context,
                  controller: TextEditingController(),
                  validator: (v) {
                    if (v?.isEmpty ?? true) {
                      return 'Please enter otp number';
                    }
                    return null;
                  },
                  onChanged: (x) {}),
              AppSize.sizedBox2h,
              WWButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
              AppSize.sizedBox6h,
              const WwText(text: 'Didn\'t receive code?'),
              AppSize.sizedBox1h,
              WwText(
                  text: 'Resend',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
