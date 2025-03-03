part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class PasswordVisibleToggled extends AuthEvent {
  final bool isVisible;

  PasswordVisibleToggled({required this.isVisible});
}
