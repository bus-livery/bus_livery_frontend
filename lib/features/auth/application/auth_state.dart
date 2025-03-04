part of 'auth_bloc.dart';

// State
class AuthState {
  final bool showPassword;
  final TextEditingController emailCtr;

  final AuthStatus status;
  final String errorMessage;

  AuthState({
    required this.status,
    required this.errorMessage,
    required this.showPassword,
    required this.emailCtr,
  });

  factory AuthState.initial() {
    return AuthState(
      showPassword: false,
      emailCtr: TextEditingController(),
      errorMessage: '',
      status: AuthStatus.initial,
    );
  }

  AuthState copyWith({
    bool? showPassword,
    TextEditingController? emailCtr,
    AuthStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      showPassword: showPassword ?? this.showPassword,
      emailCtr: emailCtr ?? this.emailCtr,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
