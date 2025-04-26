part of 'auth_bloc.dart';

// State
class AuthState {
  final int phoneMaxLength;
  final bool showLoginPass;
  final bool showSignUpPass;
  final bool showSignupConPass;
  final bool isFromLoginScreen;
  final ApiResponse<String> otpResponse;
  final ApiResponse<LoginResModel> loginOtpResponse;
  final ApiResponse<String> loginResponse;
  final ApiResponse<String> signupResponse;

  AuthState({
    required this.phoneMaxLength,
    required this.showLoginPass,
    required this.showSignUpPass,
    required this.showSignupConPass,
    required this.isFromLoginScreen,
    required this.otpResponse,
    required this.loginOtpResponse,
    required this.loginResponse,
    required this.signupResponse,
  });

  factory AuthState.initial() {
    return AuthState(
      phoneMaxLength: 10,
      showLoginPass: false,
      showSignUpPass: false,
      showSignupConPass: false,
      isFromLoginScreen: false,
      otpResponse: ApiResponse<String>(),
      loginOtpResponse: ApiResponse<LoginResModel>(),
      loginResponse: ApiResponse<String>(),
      signupResponse: ApiResponse<String>(),
    );
  }

  AuthState copyWith({
    int? phoneMaxLength,
    bool? showLoginPass,
    bool? showSignUpPass,
    bool? showSignupConPass,
    bool? isFromLoginScreen,
    TextEditingController? emailCtr,
    TextEditingController? otpCtr,
    ApiResponse<String>? otpResponse,
    ApiResponse<LoginResModel>? loginOtpResponse,
    ApiResponse<String>? loginResponse,
    ApiResponse<String>? signupResponse,
  }) {
    return AuthState(
      phoneMaxLength: phoneMaxLength ?? this.phoneMaxLength,
      showLoginPass: showLoginPass ?? this.showLoginPass,
      showSignUpPass: showSignUpPass ?? this.showSignUpPass,
      showSignupConPass: showSignupConPass ?? this.showSignupConPass,
      isFromLoginScreen: isFromLoginScreen ?? this.isFromLoginScreen,
      otpResponse: otpResponse ?? this.otpResponse,
      loginOtpResponse: loginOtpResponse ?? this.loginOtpResponse,
      loginResponse: loginResponse ?? this.loginResponse,
      signupResponse: signupResponse ?? this.signupResponse,
    );
  }
}
