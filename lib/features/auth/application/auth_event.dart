part of 'auth_bloc.dart';

// Define Auth Status Enum

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class PasswordVisibleToggled extends AuthEvent {
  final bool isVisible;
  PasswordVisibleToggled({required this.isVisible});
}

class OtpGenerateEvent extends AuthEvent {
  final String email;
  OtpGenerateEvent({required this.email});
}
