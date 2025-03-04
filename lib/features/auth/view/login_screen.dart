import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/features/auth/view/otp_screen.dart';
import 'package:livery/utils/app_images.dart';
import 'package:livery/utils/app_size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
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
                controller: bloc.state.emailCtr,
                hintText: 'Enter your email',
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.status == AuthStatus.failure) {
                        errorResponsePop(context, state.errorMessage);
                      }
                      if (state.status == AuthStatus.success) {}
                    },
                    child: WWButton(
                      loader: state.status == AuthStatus.loading,
                      text: state.showPassword ? 'Get OTP' : 'Get OTPs',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          PasswordVisibleToggled(isVisible: true),
                        );

                        context.read<AuthBloc>().add(
                          OtpGenerateEvent(email: bloc.state.emailCtr.text),
                        );

                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const OtpScreen(),
                        //   ),
                        // );
                      },
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Flexible(
                    child: Divider(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: WwText(text: 'Or connect with'),
                  ),
                  Flexible(
                    child: Divider(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ],
              ),
              WWButtonPrefixSvg(
                text: 'Continue with Google',
                icon: AppImages.google,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
