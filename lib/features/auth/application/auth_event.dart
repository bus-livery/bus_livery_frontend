part of 'auth_bloc.dart';

// Define Auth Status Enum

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class AuthPassVisible extends AuthEvent {
  final bool isVisible;
  AuthPassVisible({required this.isVisible});
}

class AuthOtpGenerateApi extends AuthEvent {
  final String email;
  final bool isFromLoginScreen;
  AuthOtpGenerateApi({required this.email, required this.isFromLoginScreen});
}

class AuthLoginApi extends AuthEvent {
  final String email;
  final String otp;
  AuthLoginApi({required this.email, required this.otp});
}

class AuthCreateUserApi extends AuthEvent {
  final String email;
  AuthCreateUserApi({required this.email});
}
