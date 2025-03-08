part of 'auth_bloc.dart';

// State
class AuthState {
  final bool showPassword;

  final ApiResponse<String> otpResponse;
  final ApiResponse<String> loginResponse;

  AuthState({
    required this.showPassword,

    required this.otpResponse,
    required this.loginResponse,
  });

  factory AuthState.initial() {
    return AuthState(
      showPassword: false,

      otpResponse: ApiResponse<String>(),
      loginResponse: ApiResponse<String>(),
    );
  }

  AuthState copyWith({
    bool? showPassword,
    TextEditingController? emailCtr,
    TextEditingController? otpCtr,
    ApiResponse<String>? otpResponse,
    ApiResponse<String>? loginResponse,
  }) {
    return AuthState(
      showPassword: showPassword ?? this.showPassword,

      otpResponse: otpResponse ?? this.otpResponse,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
