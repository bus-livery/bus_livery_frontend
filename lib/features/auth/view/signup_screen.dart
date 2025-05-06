// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:livery/Cmodel/enum.dart';
// import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
// import 'package:livery/Cwidgets/ww_buttons.dart';
// import 'package:livery/Cwidgets/ww_county_code.dart';
// import 'package:livery/Cwidgets/ww_text.dart';
// import 'package:livery/Cwidgets/ww_textfield/ww_text_field_password.dart';
// import 'package:livery/Cwidgets/ww_textfield/ww_text_field_phone.dart';
// import 'package:livery/Cwidgets/ww_textfield/ww_text_field_username.dart';
// import 'package:livery/features/auth/application/auth_bloc.dart';
// import 'package:livery/utils/app_size.dart';
// import 'package:livery/utils/router/router.gr.dart';
// import 'package:livery/utils/toast.dart';

// @RoutePage()
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<AuthBloc>();

//     return Scaffold(
//       body: Padding(
//         padding: AppSize.swPadding,
//         child: Form(
//           key: bloc.signUpFormKey,
//           child: Center(
//             child: Column(
//               spacing: 15.h,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/buss_logo.png', height: 150),
//                 WwText(text: 'SignUp'),
//                 // USER NAME
//                 WwTextFieldUsername(
//                   context: context,
//                   controller: bloc.usernameSignupCtr,
//                   hintText: 'Enter Username',
//                   showValidator: true,
//                   showSuffix: true,
//                 ),

//                 Row(
//                   children: [
//                     // COUNTRY CODE
//                     Flexible(
//                       flex: 1,
//                       child: WwCountryCode(
//                         onChanged: (countryCode, maxLength) {
//                           bloc.countryCodeSignUp = countryCode.dialCode ?? '';
//                           // Update the max length
//                           bloc.add(PhoneMaxLengthEvent(maxLength));
//                         },
//                       ),
//                     ),
//                     // PHONE NUMBER
//                     BlocSelector<AuthBloc, AuthState, int>(
//                       selector: (state) => state.phoneMaxLength,
//                       builder: (context, length) {
//                         return Expanded(
//                           flex: 2,
//                           child: WwTextFieldPhone(
//                             controller: bloc.phoneSignUpCtr,
//                             hintText: 'Enter Phone',
//                             showValidator: true,
//                             phoneMaxLength: length,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//                 // PASSWORD
//                 BlocSelector<AuthBloc, AuthState, bool>(
//                   selector: (state) => state.showSignUpPass,
//                   builder: (context, show) {
//                     return WwTextFieldPassword(
//                       controller: bloc.passSignUpCtr,
//                       hintText: 'Enter Password',
//                       showValidator: true,
//                       obscureText: !show,
//                       suffixIcon:
//                           show
//                               ? Icons.visibility_outlined
//                               : Icons.visibility_off_outlined,
//                       suffixTap: () {
//                         bloc.add(
//                           AuthPassVisibleEvent(
//                             state: PassVisibleEnum.signUpPass,
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 // CONFIRM PASSWORD
//                 BlocSelector<AuthBloc, AuthState, bool>(
//                   selector: (state) => state.showSignupConPass,
//                   builder: (context, show) {
//                     return WwTextFieldPassword(
//                       controller: bloc.conPassSignUpCtr,
//                       hintText: 'Enter Confirm Password',
//                       obscureText: !show,
//                       showValidator: true,
//                       suffixIcon:
//                           show
//                               ? Icons.visibility_outlined
//                               : Icons.visibility_off_outlined,
//                       suffixTap: () {
//                         bloc.add(
//                           AuthPassVisibleEvent(
//                             state: PassVisibleEnum.signUpPassCon,
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 _SignUpButton(bloc: bloc),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _SignUpButton extends StatelessWidget {
//   const _SignUpButton({required this.bloc});

//   final AuthBloc bloc;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthBloc, AuthState>(
//       listenWhen: (p, c) => p.signupResponse.status != c.signupResponse.status,
//       buildWhen: (p, c) => p.signupResponse.status != c.signupResponse.status,
//       listener: (context, state) {
//         if (state.signupResponse.status == ApiStatus.success) {
//           context.router.replaceAll([LoginRoute()]);
//           successToast('Acccount created');
//         }
//         if (state.signupResponse.status == ApiStatus.failure) {
//           wwDialogueBox(context, textSub: state.signupResponse.errorMessage);
//         }
//       },
//       builder: (context, state) {
//         return WWButton(
//           widthFull: true,
//           loader: state.signupResponse.status == ApiStatus.loading,
//           text: 'Sign Up',
//           onPressed: () {
//             if (!(bloc.signUpFormKey.currentState?.validate() ?? false)) {
//               return;
//             }

//             if (bloc.passSignUpCtr.text != bloc.conPassSignUpCtr.text) {
//               wwDialogueBox(
//                 context,
//                 textSub: 'Password and Confirm Password mismatch',
//               );
//               return;
//             }

//             bloc.add(
//               AuthSignUpApi(
//                 username: bloc.usernameSignupCtr.text,
//                 code: bloc.countryCodeSignUp,
//                 phone: bloc.phoneSignUpCtr.text,
//                 password: bloc.passSignUpCtr.text,
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
