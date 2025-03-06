part of 'auth_bloc.dart';

// State
class AuthState {
  final bool showPassword;
  final TextEditingController emailCtr;
  final TextEditingController otpCtr;
  final ApiResponse<String> otpResponse;
  final ApiResponse<String> loginResponse;

  AuthState({
    required this.showPassword,
    required this.emailCtr,
    required this.otpCtr,
    required this.otpResponse,
    required this.loginResponse,
  });

  factory AuthState.initial() {
    return AuthState(
      showPassword: false,
      emailCtr: TextEditingController(),
      otpCtr: TextEditingController(),
      otpResponse: ApiResponse<String>(),
      loginResponse: ApiResponse<String>(),
    );
  }

  AuthState copyWith({
    bool? showPassword,
    TextEditingController? emailCtr,
    TextEditingController? otpCtr,
    String? errorMessage,
    ApiResponse<String>? otpResponse,
    ApiResponse<String>? loginResponse,
  }) {
    return AuthState(
      showPassword: showPassword ?? this.showPassword,
      emailCtr: emailCtr ?? this.emailCtr,
      otpCtr: otpCtr ?? this.otpCtr,
      otpResponse: otpResponse ?? this.otpResponse,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
