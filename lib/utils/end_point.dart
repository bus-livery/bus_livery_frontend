final class EndPoints {
  static AuthEndPoint auth = AuthEndPoint();
  static ProfileEndPoints profile = ProfileEndPoints();
}

final class AuthEndPoint {
  final login = '/v1/auth/user-login';
  final createUser = '/v1/auth/create-user';
  final otpRegister = '/v1/auth/generate-otp';
}

final class ProfileEndPoints {
  final getMy = '/v1/profile/fetch-my';
}
