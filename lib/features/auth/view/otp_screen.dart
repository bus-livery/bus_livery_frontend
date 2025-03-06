import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_pin_code_text_field.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/main_screen.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/toast.dart';

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
              BlocSelector<AuthBloc, AuthState, String>(
                selector: (state) => state.emailCtr.text,
                builder: (context, email) {
                  return WwText(
                    text: email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              AppSize.sizedBox6h,
              WWPinCodeTextField(
                context: context,
                controller: bloc.state.otpCtr,
                validator: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Please enter otp number';
                  }
                  return null;
                },
                onChanged: (x) {},
              ),
              AppSize.sizedBox2h,
              _LoginButton(bloc: bloc),
              AppSize.sizedBox6h,
              const WwText(text: 'Didn\'t receive code?'),
              AppSize.sizedBox1h,
              WwText(
                text: 'Resend',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
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
        if (state.loginResponse.status == ApiStatus.failure) {
          errorResponsePop(context, state.loginResponse.errorMessage ?? '');
        }

        if (state.loginResponse.status == ApiStatus.success) {
          successToast('Account created');
        }
      },
      builder:
          (context, state) => WWButton(
            text: 'Continue',
            widthFull: true,
            loader: bloc.state.loginResponse.status == ApiStatus.loading,
            onPressed: () {
              context.read<AuthBloc>().add(
                AuthLoginApi(
                  email: bloc.state.emailCtr.text,
                  otp: bloc.state.otpCtr.text,
                ),
              );

              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     builder: (context) => const MainScreen(),
              //   ),
              //   (Route<dynamic> route) => false,
              // );
            },
          ),
    );
  }
}
