import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:livery/features/auth/view/login_screen.dart';
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
    registerFallbackValue(AuthloginApi(username: '', password: ''));
    registerFallbackValue(
      AuthPassVisibleEvent(state: PassVisibleEnum.loginPass),
    );
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    when(() => mockAuthBloc.state).thenAnswer((_) => AuthState.initial());
    when(
      () => mockAuthBloc.stream,
    ).thenAnswer((_) => Stream.value(AuthState.initial()));
    when(() => mockAuthBloc.usernameCtr).thenReturn(TextEditingController());
    when(() => mockAuthBloc.passwordCtr).thenReturn(TextEditingController());
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
            child: const LoginScreen(),
          ),
        );
      },
    );
  }

  testWidgets('LoginScreen renders all login form elements', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Enter Username'), findsOneWidget);
    expect(find.text('Enter Password'), findsOneWidget);
  });

  testWidgets(
    'LoginScreen toggles password visibility when visibility icon is tapped',
    (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();

      verify(
        () => mockAuthBloc.add(
          AuthPassVisibleEvent(state: PassVisibleEnum.loginPass),
        ),
      ).called(1);
    },
  );

  testWidgets('LoginScreen shows loading state when login button is pressed', (
    tester,
  ) async {
    when(() => mockAuthBloc.state).thenAnswer(
      (_) => AuthState.initial().copyWith(
        loginResponse: ApiResponse(status: ApiStatus.loading),
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('LoginScreen shows error dialog when login fails', (
    tester,
  ) async {
    when(() => mockAuthBloc.state).thenAnswer(
      (_) => AuthState.initial().copyWith(
        loginResponse: ApiResponse(
          status: ApiStatus.failure,
          errorMessage: 'Login failed',
        ),
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Login failed'), findsOneWidget);
  });
}
