import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/common_widgets/ww_buttons.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/common_widgets/ww_textfield.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/features/auth/view/otp_screen.dart';
import 'package:livery/utils/app_size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSize.swPadding,
        child: Center(
          child: Column(
            spacing: 15.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/buss_logo.png', height: 150),
              WWTextFieldEmail(
                  controller: TextEditingController(),
                  hintText: 'Enter your email'),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return WWButton(
                    text: state.showPassword ? 'Get OTP' : 'Get OTPs',
                    onPressed: () {
                      context
                          .read<AuthBloc>()
                          .add(PasswordVisibleToggled(isVisible: true));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
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
              WWButtonPrefixSvg(
                text: 'Continue with Google',
                icon: 'assets/svg/google.svg',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
