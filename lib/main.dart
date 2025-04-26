import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/features/auth/application/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/top_users/application/top_users_bloc.dart';
import 'package:livery/service/ad_service.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/router/router.dart';

final GlobalKey<ScaffoldMessengerState> smKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  // Initialize services
  await getIt<SharedPrefService>().init();
  await getIt<AdService>().initAds(); // Initialize ad service

  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = getIt<AppRouter>();
  final botToastBuilder = BotToastInit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<ProfileBloc>()),
        BlocProvider(create: (context) => getIt<LiveryBloc>()),
        BlocProvider(create: (context) => getIt<ReportBloc>()),
        BlocProvider(create: (context) => getIt<TopUsersBloc>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: false,
        designSize: const Size(376, 814),
        builder: (context, snapshot) {
          return MaterialApp.router(
            title: 'Livery',
            routerConfig: _appRouter.config(),
            scaffoldMessengerKey: smKey,
            themeMode: ThemeMode.dark,
            builder: (context, child) => botToastBuilder(context, child),
            darkTheme: ThemeData(
              fontFamily: GoogleFonts.openSans().fontFamily,
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark,
                seedColor: const Color.fromARGB(255, 40, 26, 119),
              ),
              useMaterial3: true,
            ),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                surface: Colors.white,
                // background: Colors.white,
                brightness: Brightness.light,
                seedColor: const Color.fromARGB(255, 40, 26, 119),
              ),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
