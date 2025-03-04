part of 'auth_bloc.dart';

abstract class AuthState {
  final bool showPassword;

  AuthState({required this.showPassword});

  AuthState copyWith({bool? showPassword});
}

class AuthInitial extends AuthState {
  AuthInitial({super.showPassword = false});

  @override
  AuthInitial copyWith({bool? showPassword}) {
    return AuthInitial(
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
