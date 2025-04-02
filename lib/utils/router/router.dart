import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/router/router_guard.dart';
import 'package:livery/utils/router/router_names.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: RouterNames.loginScreen),

    AutoRoute(page: OtpRoute.page, path: RouterNames.otpScreen),

    AutoRoute(
      initial: true,
      guards: [AuthGuard()],
      page: MainRoute.page,
      path: RouterNames.mainScreen,
    ),

    AutoRoute(page: EditProfileRoute.page, path: RouterNames.editProfileScreen),

    AutoRoute(
      page: OtherProfileRoute.page,
      path: RouterNames.otherProfileScreen,
    ),

    AutoRoute(
      page: LiveryCreateRoute.page,
      path: RouterNames.liveryCreateScreen,
    ),

    AutoRoute(page: ProfileListRoute.page, path: RouterNames.profileListScreen),

    AutoRoute(
      page: LiveryDownloadsRoute.page,
      path: RouterNames.liveryDownloadsScreen,
    ),
  ];
}
