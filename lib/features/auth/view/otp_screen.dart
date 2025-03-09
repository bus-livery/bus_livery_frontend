import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_pin_code_text_field.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/router/router_names.dart';
import 'package:livery/utils/toast.dart';

@RoutePage()
class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return Scaffold(
      body: Padding(
        padding: AppSize.swPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WwText(
                text: 'Verification',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              AppSize.sizedBox4h,
              WwText(
                text: 'Enter the code sent to the email',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              AppSize.sizedBox2h,
              WwText(
                text: bloc.emailCtr.text,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              AppSize.sizedBox6h,
              // OTP FIELD-----------------------------
              WWPinCodeTextField(
                context: context,
                controller: bloc.otpCtr,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Please enter otp number';
                  }
                  return null;
                },
                onChanged: (x) {},
              ),
              AppSize.sizedBox2h,
              // LOGIN BUTTON----------------------------
              _LoginButton(bloc: bloc),
              AppSize.sizedBox6h,
              const WwText(text: 'Didn\'t receive code?'),
              AppSize.sizedBox1h,
              // RESEND BUTTON----------------------------
              _ResendButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResendButton extends StatelessWidget {
  const _ResendButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      key: UniqueKey(),
      buildWhen: (p, c) => p.otpResponse.status != c.otpResponse.status,
      listenWhen: (p, c) => p.otpResponse.status != c.otpResponse.status,
      listener: (context, state) {
        if (state.otpResponse.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.otpResponse.errorMessage ?? '');
        }
        if (state.otpResponse.status == ApiStatus.success) {
          successToast(state.otpResponse.apiData ?? '');
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextButton(
                onPressed: () {
                  final bloc = context.read<AuthBloc>();
                  bloc.add(
                    AuthOtpGenerateApi(
                      isFromLoginScreen: false,
                      email: bloc.emailCtr.text,
                    ),
                  );
                },
                child: WwText(
                  text: 'Resend',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            AppSize.sizedBox1w,
            state.otpResponse.status != ApiStatus.loading
                ? SizedBox()
                : SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.bloc});

  final AuthBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.loginResponse.status != c.loginResponse.status,
      listenWhen: (p, c) => p.loginResponse.status != c.loginResponse.status,
      listener: (context, state) {
        var logRes = state.loginResponse;
        if (logRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: logRes.errorMessage ?? '');
        }

        if (logRes.status == ApiStatus.success) {
          // ACCOUNT IS NOT REGISTERED
          if (logRes.apiData?.statusCode == 202) {
            wwDialogueBox2Button(
              context,
              textSub: logRes.apiData?.message ?? '',
              firstTap: () => context.router.back(),
              secondTap: () {
                bloc.add(AuthCreateUserApi(email: bloc.emailCtr.text));
                context.router.maybePop();
              },
            );
            return;
          }
          successToast(logRes.apiData?.message ?? '');
          context.router.pushPath(RouterNames.mainScreen);
        }
      },
      builder: (context, state) => WWButton(
        text: 'Continue',
        widthFull: true,
        loader: state.loginResponse.status == ApiStatus.loading,
        onPressed: () {
          bloc.add(
            AuthLoginApi(email: bloc.emailCtr.text, otp: bloc.otpCtr.text),
          );
        },
      ),
    );
  }
}
