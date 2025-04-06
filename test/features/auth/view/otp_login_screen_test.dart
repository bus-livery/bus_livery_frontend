import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/features/auth/view/login_with_otp_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:livery/Cmodel/api_response.dart';

class MockAuthBloc extends Mock implements AuthBloc {
  @override
  Future<void> close() async {}
}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() {
    registerFallbackValue(AuthState.initial());
    registerFallbackValue(
      AuthOtpGenerateApi(phone: '', code: '', isFromLoginScreen: true),
    );
    registerFallbackValue(AuthloginOtpApi(email: '', otp: ''));
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    when(() => mockAuthBloc.state).thenAnswer((_) => AuthState.initial());
    when(
      () => mockAuthBloc.stream,
    ).thenAnswer((_) => Stream.value(AuthState.initial()));
    when(() => mockAuthBloc.phoneCtr).thenReturn(TextEditingController());
    when(() => mockAuthBloc.otpCtr).thenReturn(TextEditingController());
    when(() => mockAuthBloc.countryCodeOtpLogin).thenReturn('+91');
  });

  tearDown(() {
    mockAuthBloc.close();
  });

  Widget createWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          home: MultiBlocProvider(
            providers: [BlocProvider<AuthBloc>.value(value: mockAuthBloc)],
            child: const LoginWithOtpScreen(),
          ),
        );
      },
    );
  }

  testWidgets('OTPLoginScreen renders all OTP login form elements', (
    tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('OTP Login'), findsOneWidget);
    expect(find.text('Enter Phone Number'), findsOneWidget);
    expect(find.text('Enter OTP'), findsOneWidget);
  });

  testWidgets(
    'OTPLoginScreen shows loading state when send OTP button is pressed',
    (tester) async {
      when(() => mockAuthBloc.state).thenAnswer(
        (_) => AuthState.initial().copyWith(
          otpResponse: ApiResponse(status: ApiStatus.loading),
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final sendOtpButton = find.widgetWithText(ElevatedButton, 'Send OTP');
      expect(sendOtpButton, findsOneWidget);

      await tester.tap(sendOtpButton);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets('OTPLoginScreen shows error dialog when send OTP fails', (
    tester,
  ) async {
    when(() => mockAuthBloc.state).thenAnswer(
      (_) => AuthState.initial().copyWith(
        otpResponse: ApiResponse(
          status: ApiStatus.failure,
          errorMessage: 'Failed to send OTP',
        ),
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final sendOtpButton = find.widgetWithText(ElevatedButton, 'Send OTP');
    expect(sendOtpButton, findsOneWidget);

    await tester.tap(sendOtpButton);
    await tester.pump();

    expect(find.text('Failed to send OTP'), findsOneWidget);
  });

  testWidgets(
    'OTPLoginScreen shows loading state when verify OTP button is pressed',
    (tester) async {
      when(() => mockAuthBloc.state).thenAnswer(
        (_) => AuthState.initial().copyWith(
          loginOtpResponse: ApiResponse(status: ApiStatus.loading),
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final verifyOtpButton = find.widgetWithText(ElevatedButton, 'Continue');
      expect(verifyOtpButton, findsOneWidget);

      await tester.tap(verifyOtpButton);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets('OTPLoginScreen shows error dialog when verify OTP fails', (
    tester,
  ) async {
    when(() => mockAuthBloc.state).thenAnswer(
      (_) => AuthState.initial().copyWith(
        loginOtpResponse: ApiResponse(
          status: ApiStatus.failure,
          errorMessage: 'Failed to verify OTP',
        ),
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final verifyOtpButton = find.widgetWithText(ElevatedButton, 'Continue');
    expect(verifyOtpButton, findsOneWidget);

    await tester.tap(verifyOtpButton);
    await tester.pump();

    expect(find.text('Failed to verify OTP'), findsOneWidget);
  });
}
