part of 'auth_bloc.dart';

// State
class AuthState {
  final bool showPassword;
  final bool isFromLoginScreen;
  final ApiResponse<String> otpResponse;
  final ApiResponse<LoginResModel> loginResponse;

  AuthState({
    required this.showPassword,
    required this.isFromLoginScreen,
    required this.otpResponse,
    required this.loginResponse,
  });

  factory AuthState.initial() {
    return AuthState(
      showPassword: false,
      isFromLoginScreen: false,
      otpResponse: ApiResponse<String>(),
      loginResponse: ApiResponse<LoginResModel>(),
    );
  }

  AuthState copyWith({
    bool? showPassword,
    bool? isFromLoginScreen,
    TextEditingController? emailCtr,
    TextEditingController? otpCtr,
    ApiResponse<String>? otpResponse,
    ApiResponse<LoginResModel>? loginResponse,
  }) {
    return AuthState(
      showPassword: showPassword ?? this.showPassword,
      isFromLoginScreen: isFromLoginScreen ?? this.isFromLoginScreen,
      otpResponse: otpResponse ?? this.otpResponse,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
