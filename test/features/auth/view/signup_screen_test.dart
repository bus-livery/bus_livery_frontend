// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:livery/Cmodel/enum.dart';
// import 'package:livery/features/auth/application/auth_bloc.dart';
// import 'package:livery/features/auth/view/signup_screen.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:livery/Cmodel/api_response.dart';

// class MockAuthBloc extends Mock implements AuthBloc {
//   @override
//   Future<void> close() async {}
// }

// void main() {
//   late MockAuthBloc mockAuthBloc;

//   setUpAll(() {
//     registerFallbackValue(AuthState.initial());
//     registerFallbackValue(
//       AuthSignUpApi(username: '', code: '', phone: '', password: ''),
//     );
//     registerFallbackValue(
//       AuthPassVisibleEvent(state: PassVisibleEnum.signUpPass),
//     );
//   });

//   setUp(() {
//     mockAuthBloc = MockAuthBloc();
//     when(() => mockAuthBloc.state).thenAnswer((_) => AuthState.initial());
//     when(
//       () => mockAuthBloc.stream,
//     ).thenAnswer((_) => Stream.value(AuthState.initial()));
//     when(
//       () => mockAuthBloc.usernameSignupCtr,
//     ).thenReturn(TextEditingController());
//     when(() => mockAuthBloc.phoneSignUpCtr).thenReturn(TextEditingController());
//     when(() => mockAuthBloc.passSignUpCtr).thenReturn(TextEditingController());
//     when(
//       () => mockAuthBloc.conPassSignUpCtr,
//     ).thenReturn(TextEditingController());
//     when(() => mockAuthBloc.countryCodeSignUp).thenReturn('+91');
//   });

//   tearDown(() {
//     mockAuthBloc.close();
//   });

//   Widget createWidgetUnderTest() {
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return MaterialApp(
//           home: MultiBlocProvider(
//             providers: [BlocProvider<AuthBloc>.value(value: mockAuthBloc)],
//             child: const SignUpScreen(),
//           ),
//         );
//       },
//     );
//   }

//   testWidgets('SignUpScreen renders all signup form elements', (tester) async {
//     await tester.pumpWidget(createWidgetUnderTest());
//     await tester.pumpAndSettle();

//     expect(find.text('Sign Up'), findsOneWidget);
//     expect(find.text('Enter Username'), findsOneWidget);
//     expect(find.text('Enter Phone Number'), findsOneWidget);
//     expect(find.text('Enter Password'), findsOneWidget);
//     expect(find.text('Confirm Password'), findsOneWidget);
//   });

//   testWidgets(
//     'SignUpScreen toggles password visibility when visibility icon is tapped',
//     (tester) async {
//       await tester.pumpWidget(createWidgetUnderTest());
//       await tester.pumpAndSettle();

//       expect(find.byIcon(Icons.visibility_off_outlined), findsNWidgets(2));

//       await tester.tap(find.byIcon(Icons.visibility_off_outlined).first);
//       await tester.pump();

//       verify(
//         () => mockAuthBloc.add(
//           AuthPassVisibleEvent(state: PassVisibleEnum.signUpPass),
//         ),
//       ).called(1);
//     },
//   );

//   testWidgets(
//     'SignUpScreen shows loading state when sign up button is pressed',
//     (tester) async {
//       when(() => mockAuthBloc.state).thenAnswer(
//         (_) => AuthState.initial().copyWith(
//           signupResponse: ApiResponse(status: ApiStatus.loading),
//         ),
//       );

//       await tester.pumpWidget(createWidgetUnderTest());
//       await tester.pumpAndSettle();

//       final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');
//       expect(signUpButton, findsOneWidget);

//       await tester.tap(signUpButton);
//       await tester.pump();

//       expect(find.byType(CircularProgressIndicator), findsOneWidget);
//     },
//   );

//   testWidgets('SignUpScreen shows error dialog when sign up fails', (
//     tester,
//   ) async {
//     when(() => mockAuthBloc.state).thenAnswer(
//       (_) => AuthState.initial().copyWith(
//         signupResponse: ApiResponse(
//           status: ApiStatus.failure,
//           errorMessage: 'Sign up failed',
//         ),
//       ),
//     );

//     await tester.pumpWidget(createWidgetUnderTest());
//     await tester.pumpAndSettle();

//     final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');
//     expect(signUpButton, findsOneWidget);

//     await tester.tap(signUpButton);
//     await tester.pump();

//     expect(find.text('Sign up failed'), findsOneWidget);
//   });
// }
