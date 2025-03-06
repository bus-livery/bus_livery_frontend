final class EndPoints {
  static AuthEndPoint auth = AuthEndPoint();
}

final class AuthEndPoint {
  final login = '/v1/auth/create-user';
  final otpRegister = '/v1/auth/generate-otp';
}
