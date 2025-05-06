import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/router/router_names.dart';
import 'package:livery/utils/toast.dart';

@RoutePage()
class GmailWithOtpScreen extends StatelessWidget {
  const GmailWithOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Scaffold(
      body: Form(
        key: bloc.loginWithOtpFormKey,
        child: Padding(
          padding: AppSize.swPadding,
          child: Center(
            child: Column(
              spacing: 15.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/buss_logo.png', height: 150),
                WWTextFieldEmail(
                  controller: bloc.gmailEmailCtr,
                  hintText: 'Enter your email',
                ),
                // BUTTON GENERATE OTP-------------------------------
                _ButtonGenerateOtp(bloc: bloc),
              ],
            ),
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
              p.gmailOtpResponse.status != c.gmailOtpResponse.status &&
              c.isFromLoginScreen,
      listenWhen:
          (p, c) =>
              p.gmailOtpResponse.status != c.gmailOtpResponse.status &&
              c.isFromLoginScreen,
      listener: (context, state) {
        if (state.gmailOtpResponse.status == ApiStatus.failure) {
          wwDialogueBox(
            context,
            textSub: state.gmailOtpResponse.errorMessage ?? '',
          );
        }
        if (state.gmailOtpResponse.status == ApiStatus.success) {
          successToast(state.gmailOtpResponse.apiData ?? '');
          // navigation to otp screen
          context.router.pushPath(RouterNames.otpScreen);
        }
      },
      builder:
          (context, state) => WWButton(
            widthFull: true,
            loader: state.gmailOtpResponse.status == ApiStatus.loading,
            text: 'Get OTP',
            onPressed: () {
              if (!(bloc.loginWithOtpFormKey.currentState?.validate() ??
                  false)) {
                return;
              }
              context.read<AuthBloc>().add(
                AuthGmailOtpGenerateApi(
                  email: bloc.gmailEmailCtr.text.trim(),
                  isFromLoginScreen: true,
                ),
              );
            },
          ),
    );
  }
}
