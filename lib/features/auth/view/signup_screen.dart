import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field_password.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field_phone.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field_username.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/router/router.gr.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              WwText(text: 'SignUp'),
              WwTextFieldUsername(
                controller: bloc.phoneCtr,
                hintText: 'Enter Username',
                suffixTap: () {},
              ),
              WwTextFieldPhone(
                controller: bloc.phoneCtr,
                hintText: 'Enter Phone',
              ),
              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.showSignUpPass,
                builder: (context, show) {
                  return WwTextFieldPassword(
                    controller: bloc.phoneCtr,
                    hintText: 'Enter Password',
                    obscureText: !show,
                    suffixIcon:
                        show
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                    suffixTap: () {
                      bloc.add(
                        AuthPassVisibleEvent(state: PassVisibleEnum.signUpPass),
                      );
                    },
                  );
                },
              ),

              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) => state.showSignupConPass,
                builder: (context, show) {
                  return WwTextFieldPassword(
                    controller: bloc.phoneCtr,
                    hintText: 'Enter Confirm Password',
                    obscureText: !show,
                    suffixIcon:
                        show
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                    suffixTap: () {
                      bloc.add(
                        AuthPassVisibleEvent(
                          state: PassVisibleEnum.signUpPassCon,
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
                  context.router.replaceAll([LoginRoute()]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
