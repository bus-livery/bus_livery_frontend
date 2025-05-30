import 'package:auto_route/auto_route.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/token_expire.dart';

bool isAuthenticated() {
  String? token = getIt<SharedPrefService>().getString("token");
  return (token != null && token.isNotEmpty)
      ? jwtTokenChecker(Jwt.parseJwt(token))
      : false;
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated()) {
      resolver.next(true);
    } else {
      resolver.redirectUntil(const GmailWithOtpRoute());
    }
  }
}
