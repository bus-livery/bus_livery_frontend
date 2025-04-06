part of 'auth_bloc.dart';

// State
class AuthState {
  final bool showLoginPass;
  final bool showSignUpPass;
  final bool showSignupConPass;
  final bool isFromLoginScreen;
  final ApiResponse<String> otpResponse;
  final ApiResponse<LoginResModel> loginOtpResponse;
  final ApiResponse<String> loginResponse;
  final ApiResponse<String> signUpResponse;

  AuthState({
    required this.showLoginPass,
    required this.showSignUpPass,
    required this.showSignupConPass,
    required this.isFromLoginScreen,
    required this.otpResponse,
    required this.loginOtpResponse,
    required this.loginResponse,
    required this.signUpResponse,
  });

  factory AuthState.initial() {
    return AuthState(
      showLoginPass: false,
      showSignUpPass: false,
      showSignupConPass: false,
      isFromLoginScreen: false,
      otpResponse: ApiResponse<String>(),
      loginOtpResponse: ApiResponse<LoginResModel>(),
      loginResponse: ApiResponse<String>(),
      signUpResponse: ApiResponse<String>(),
    );
  }

  AuthState copyWith({
    bool? showLoginPass,
    bool? showSignUpPass,
    bool? showSignupConPass,
    bool? isFromLoginScreen,
    TextEditingController? emailCtr,
    TextEditingController? otpCtr,
    ApiResponse<String>? otpResponse,
    ApiResponse<LoginResModel>? loginOtpResponse,
    ApiResponse<String>? loginResponse,
    ApiResponse<String>? signUpResponse,
  }) {
    return AuthState(
      showLoginPass: showLoginPass ?? this.showLoginPass,
      showSignUpPass: showSignUpPass ?? this.showSignUpPass,
      showSignupConPass: showSignupConPass ?? this.showSignupConPass,
      isFromLoginScreen: isFromLoginScreen ?? this.isFromLoginScreen,
      otpResponse: otpResponse ?? this.otpResponse,
      loginOtpResponse: loginOtpResponse ?? this.loginOtpResponse,
      loginResponse: loginResponse ?? this.loginResponse,
      signUpResponse: signUpResponse ?? this.signUpResponse,
    );
  }
}
