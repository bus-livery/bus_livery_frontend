part of 'auth_bloc.dart';

// State
class AuthState {
  final bool showPassword;
  final TextEditingController emailCtr;
  final ApiResponse<String> otpResponse;

  AuthState({
    required this.showPassword,
    required this.emailCtr,
    required this.otpResponse,
  });

  factory AuthState.initial() {
    return AuthState(
      showPassword: false,
      emailCtr: TextEditingController(),
      otpResponse: ApiResponse<String>(),
    );
  }

  AuthState copyWith({
    bool? showPassword,
    TextEditingController? emailCtr,
    String? errorMessage,
    ApiResponse<String>? otpResponse,
  }) {
    return AuthState(
      showPassword: showPassword ?? this.showPassword,
      emailCtr: emailCtr ?? this.emailCtr,
      otpResponse: otpResponse ?? this.otpResponse,
    );
  }
}
