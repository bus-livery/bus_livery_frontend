import 'package:auto_route/auto_route.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/token_expire.dart';

class AuthGuardMobile extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    String? token = getIt<SharedPrefService>().getString("token");
    final isAuthenticated =
        (token != null && token.isNotEmpty)
            ? jwtTokenChecker(Jwt.parseJwt(token))
            : false;

    if (isAuthenticated) {
      resolver.next(true);
    } else {
      // resolver.redirect(const LoginRouteMobile());
    }
  }
}
