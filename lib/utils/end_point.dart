final class EndPoints {
  static AuthEndPoint auth = AuthEndPoint();
}

final class AuthEndPoint {
  final login = '';
  final otpRegister = '/v1/auth/generate-otp';
}
