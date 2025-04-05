part of 'auth_bloc.dart';

// Define Auth Status Enum

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class AuthPassVisibleEvent extends AuthEvent {
  final PassVisibleEnum state;
  AuthPassVisibleEvent({required this.state});
}

class AuthOtpGenerateApi extends AuthEvent {
  final String phone;
  final bool isFromLoginScreen;
  AuthOtpGenerateApi({required this.phone, required this.isFromLoginScreen});
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
