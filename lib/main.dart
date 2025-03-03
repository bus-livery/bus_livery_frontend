import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livery/features/auth/controller/bloc/auth_bloc.dart';
import 'package:livery/features/auth/view/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthBloc())],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: false,
          designSize: const Size(376, 814),
          builder: (context, snapshot) {
            return MaterialApp(
                title: 'Flutter Demo',
                themeMode: ThemeMode.dark,
                darkTheme: ThemeData(
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  colorScheme: ColorScheme.fromSeed(
                      brightness: Brightness.dark,
                      seedColor: const Color.fromARGB(255, 40, 26, 119)),
                  useMaterial3: true,
                ),
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      surface: Colors.white,
                      // background: Colors.white,
                      brightness: Brightness.light,
                      seedColor: const Color.fromARGB(255, 40, 26, 119)),
                  useMaterial3: true,
                ),
                home: const LoginScreen());
          }),
    );
  }
}
