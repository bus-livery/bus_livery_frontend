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
  final ApiResponse<String> gmailOtpResponse;
  final ApiResponse<LoginResModel> gmailLoginResponse;
  final ApiResponse<LoginResModel> googleLoginResponse;

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
    required this.gmailOtpResponse,
    required this.gmailLoginResponse,
    required this.googleLoginResponse,
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
      gmailOtpResponse: ApiResponse<String>(),
      gmailLoginResponse: ApiResponse<LoginResModel>(),
      googleLoginResponse: ApiResponse<LoginResModel>(),
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
    ApiResponse<String>? gmailOtpResponse,
    ApiResponse<LoginResModel>? gmailLoginResponse,
    ApiResponse<LoginResModel>? googleLoginResponse,
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
      gmailOtpResponse: gmailOtpResponse ?? this.gmailOtpResponse,
      gmailLoginResponse: gmailLoginResponse ?? this.gmailLoginResponse,
      googleLoginResponse: googleLoginResponse ?? this.googleLoginResponse,
    );
  }
}
