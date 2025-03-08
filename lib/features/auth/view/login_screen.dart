import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/utils/app_images.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/router/router_names.dart';
import 'package:livery/utils/toast.dart';

@RoutePage()
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
                controller: bloc.emailCtr,
                hintText: 'Enter your email',
              ),
              // BUTTON GENERATE OTP-------------------------------
              _ButtonGenerateOtp(bloc: bloc),
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

class _ButtonGenerateOtp extends StatelessWidget {
  const _ButtonGenerateOtp({required this.bloc});

  final AuthBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      buildWhen:
          (p, c) =>
              p.otpResponse.status != c.otpResponse.status &&
              c.isFromLoginScreen,
      listenWhen:
          (p, c) =>
              p.otpResponse.status != c.otpResponse.status &&
              c.isFromLoginScreen,
      listener: (context, state) {
        if (state.otpResponse.status == ApiStatus.failure) {
          errorResponsePop(context, state.otpResponse.errorMessage ?? '');
        }
        if (state.otpResponse.status == ApiStatus.success) {
          successToast(state.otpResponse.apiData ?? '');
          // navigation to otp screen
          context.router.pushPath(RouterNames.otpScreen);
        }
      },
      builder:
          (context, state) => WWButton(
            widthFull: true,
            loader: state.otpResponse.status == ApiStatus.loading,
            text: 'Get OTP',
            onPressed: () {
              context.read<AuthBloc>().add(
                AuthOtpGenerateApi(
                  isFromLoginScreen: true,
                  email: bloc.emailCtr.text,
                ),
              );
            },
          ),
    );
  }
}
