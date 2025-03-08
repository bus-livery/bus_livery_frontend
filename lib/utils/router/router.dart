import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/router/router_names.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: RouterNames.loginScreen),

    AutoRoute(page: OtpRoute.page, path: RouterNames.otpScreen),
  ];
}
