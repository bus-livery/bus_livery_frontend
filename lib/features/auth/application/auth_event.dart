part of 'auth_bloc.dart';

// Define Auth Status Enum
enum AuthStatus { initial, loading, success, failure }

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
