part of 'auth_bloc.dart';

// Define Auth Status Enum

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class PasswordVisibleToggled extends AuthEvent {
  final bool isVisible;
  PasswordVisibleToggled({required this.isVisible});
}

class AuthOtpGenerateApi extends AuthEvent {
  final String email;
  AuthOtpGenerateApi({required this.email});
}

class AuthLoginApi extends AuthEvent {
  final String email;
  final String otp;
  AuthLoginApi({required this.email, required this.otp});
}
