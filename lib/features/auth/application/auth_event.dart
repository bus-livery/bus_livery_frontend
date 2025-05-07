part of 'auth_bloc.dart';

// Define Auth Status Enum

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

// class AuthPassVisibleEvent extends AuthEvent {
//   final PassVisibleEnum state;
//   AuthPassVisibleEvent({required this.state});
// }

class PhoneMaxLengthEvent extends AuthEvent {
  final int length;

  PhoneMaxLengthEvent(this.length);
}

// API EVENTS

// class AuthloginApi extends AuthEvent {
//   final String username;
//   final String password;
//   AuthloginApi({required this.username, required this.password});
// }

// class AuthSignUpApi extends AuthEvent {
//   final String username;
//   final String code;
//   final String phone;
//   final String password;
//   AuthSignUpApi({
//     required this.username,
//     required this.code,
//     required this.phone,
//     required this.password,
//   });
// }

// class AuthOtpGenerateApi extends AuthEvent {
//   final String phone;
//   final String code;
//   final bool isFromLoginScreen;
//   AuthOtpGenerateApi({
//     required this.phone,
//     required this.isFromLoginScreen,
//     required this.code,
//   });
// }

// class AuthloginOtpApi extends AuthEvent {
//   final String email;
//   final String otp;
//   final String code;
//   AuthloginOtpApi({required this.email, required this.otp, required this.code});
// }

class AuthCreateUserOtpApi extends AuthEvent {
  final String email;
  AuthCreateUserOtpApi({required this.email});
}

class AuthGmailOtpGenerateApi extends AuthEvent {
  final String email;
  final bool isFromLoginScreen;
  AuthGmailOtpGenerateApi({
    required this.email,
    required this.isFromLoginScreen,
  });
}

class AuthGmailOtpLoginApi extends AuthEvent {
  final String email;
  final String otp;
  AuthGmailOtpLoginApi({required this.email, required this.otp});
}
