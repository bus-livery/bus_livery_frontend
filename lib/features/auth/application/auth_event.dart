part of 'auth_bloc.dart';

// Define Auth Status Enum

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class AuthPassVisibleEvent extends AuthEvent {
  final PassVisibleEnum state;
  AuthPassVisibleEvent({required this.state});
}

// API EVENTS

class AuthloginApi extends AuthEvent {
  final String username;
  final String password;
  AuthloginApi({required this.username, required this.password});
}

class AuthSignUpApi extends AuthEvent {
  final String username;
  final String code;
  final String phone;
  final String password;
  AuthSignUpApi({
    required this.username,
    required this.code,
    required this.phone,
    required this.password,
  });
}

class AuthOtpGenerateApi extends AuthEvent {
  final String phone;
  final String code;
  final bool isFromLoginScreen;
  AuthOtpGenerateApi({
    required this.phone,
    required this.isFromLoginScreen,
    required this.code,
  });
}

class AuthloginOtpApi extends AuthEvent {
  final String email;
  final String otp;
  AuthloginOtpApi({required this.email, required this.otp});
}

class AuthCreateUserOtpApi extends AuthEvent {
  final String phone;
  AuthCreateUserOtpApi({required this.phone});
}
