import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field_password.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field_username.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
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
              WwText(text: 'Login'),
              WwTextFieldUsername(
                controller: bloc.usernameCtr,
                hintText: 'Enter Username',
              ),
              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.showLoginPass,
                builder: (context, show) {
                  return WwTextFieldPassword(
                    controller: bloc.passwordCtr,
                    hintText: 'Enter Password',
                    obscureText: !show,
                    suffixIcon:
                        show
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                    suffixTap: () {
                      bloc.add(
                        AuthPassVisibleEvent(state: PassVisibleEnum.loginPass),
                      );
                    },
                  );
                },
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listenWhen:
                    (p, c) => p.loginResponse.status != c.loginResponse.status,
                buildWhen:
                    (p, c) => p.loginResponse.status != c.loginResponse.status,
                listener: (context, state) {
                  if (state.loginResponse.status == ApiStatus.success) {
                    context.router.pushPath(RouterNames.mainScreen);
                    successToast('Acccount logged');
                  }
                  if (state.loginResponse.status == ApiStatus.failure) {
                    wwDialogueBox(
                      context,
                      textSub: state.loginResponse.errorMessage,
                    );
                  }
                },
                builder: (context, state) {
                  return WWButton(
                    widthFull: true,
                    loader: state.loginResponse.status == ApiStatus.loading,
                    text: 'Login',
                    onPressed: () {
                      bloc.add(
                        AuthloginApi(
                          username: bloc.usernameCtr.text,
                          password: bloc.passwordCtr.text,
                        ),
                      );
                    },
                  );
                },
              ),
              WWButton(
                widthFull: true,
                loader: false,
                text: 'Sign Up',
                onPressed: () {
                  context.router.pushPath(RouterNames.signUpScreen);
                },
              ),
              TextButton(
                onPressed: () {
                  context.router.pushPath(RouterNames.loginWithOtpScreen);
                },
                child: WwText(text: 'login or signUp with otp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
