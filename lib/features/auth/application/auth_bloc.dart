import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/auth/service/auth_service.dart';
import 'package:livery/utils/custom_print.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService iAuthService;
  AuthBloc(this.iAuthService) : super(AuthState.initial()) {
    customPrint('AUTH BLOC INITIALIZED');
    otpTimer();
    //
    on<AuthEvent>((event, emit) {});

    on<AuthloginApi>(_authLoginApi);

    on<AuthSignUpApi>(_authSignUpApi);

    on<AuthPassVisibleEvent>(_authPassVisible);

    on<AuthOtpGenerateApi>(_authOtpGenerateApi);

    on<AuthloginOtpApi>(_authloginOtpApi);

    on<AuthCreateUserOtpApi>(_authCreateUserOtpApi);
  }

  // LOGIN SCREEN
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  // SIGN UP SCREEN

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final usernameSignupCtr = TextEditingController();
  final phoneSignUpCtr = TextEditingController();
  final passSignUpCtr = TextEditingController();
  final conPassSignUpCtr = TextEditingController();
  String countryCodeSignUp = '+91';

  // LOGIN WITH OTP
  final phoneCtr = TextEditingController();
  final otpCtr = TextEditingController();
  String countryCodeOtpLogin = '+91';

  Timer? timer;

  int otpTimOut = 60;

  Stream<int> otpTimer() async* {
    final timerController = StreamController<int>();

    Timer.periodic(const Duration(seconds: 1), (callback) {
      if (otpTimOut > 0) {
        otpTimOut--;
        timerController.add(otpTimOut);
      } else {
        callback.cancel();
        timerController.add(0);
        timerController.close();
      }
    });

    yield* timerController.stream;
  }

  //  +-+ +-+ +-+ +-+ +-+
  //  |C| |L| |O| |S| |E|
  //  +-+ +-+ +-+ +-+ +-+
  @override
  Future<void> close() async {
    // dispose();
    customPrint('AUTH BLOC CLOSED');

    // LOGIN SCREEN
    usernameCtr.dispose();
    passwordCtr.dispose();

    // SIGNUP SCREEN
    usernameSignupCtr.dispose();
    phoneSignUpCtr.dispose();
    passSignUpCtr.dispose();
    conPassSignUpCtr.dispose();

    phoneCtr.dispose();
    otpCtr.dispose();
    super.close();
  }

  void clearCtr() {
    // LOGIN SCREEN
    usernameCtr.clear();
    passwordCtr.clear();

    // SIGNUP SCREEN
    usernameSignupCtr.clear();
    phoneSignUpCtr.clear();
    passSignUpCtr.clear();
    conPassSignUpCtr.clear();

    phoneCtr.clear();
    otpCtr.clear();
  }

  _authPassVisible(AuthPassVisibleEvent event, emit) {
    switch (event.state) {
      case PassVisibleEnum.loginPass:
        emit(state.copyWith(showLoginPass: !state.showLoginPass));
        break;
      case PassVisibleEnum.signUpPass:
        emit(state.copyWith(showSignUpPass: !state.showSignUpPass));
        break;
      case PassVisibleEnum.signUpPassCon:
        emit(state.copyWith(showSignupConPass: !state.showSignupConPass));
        break;
    }
  }

  _authLoginApi(AuthloginApi event, emit) async {
    emit(state.copyWith(loginResponse: ApiResponse(status: ApiStatus.loading)));

    final response = await iAuthService.loginApi(
      username: event.username,
      password: event.password,
    );
    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            loginResponse: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        clearCtr();
        emit(
          state.copyWith(
            loginResponse: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _authSignUpApi(AuthSignUpApi event, emit) async {
    emit(
      state.copyWith(signUpResponse: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iAuthService.signUpApi(
      data: {
        "username": event.username,
        "password": event.password,
        "county_code": event.code,
        "phone": event.phone,
      },
    );
    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            signUpResponse: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            signUpResponse: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
        clearCtr();
      },
    );
  }

  _authOtpGenerateApi(AuthOtpGenerateApi event, emit) async {
    emit(
      state.copyWith(
        isFromLoginScreen: event.isFromLoginScreen,
        otpResponse: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await iAuthService.otpGenerate(phone: event.phone);

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            otpResponse: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            otpResponse: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _authloginOtpApi(AuthloginOtpApi event, emit) async {
    emit(
      state.copyWith(loginOtpResponse: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iAuthService.loginOtpApi(
      email: event.email,
      otp: event.otp,
    );
    otpCtr.clear();
    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            loginOtpResponse: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            loginOtpResponse: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _authCreateUserOtpApi(AuthCreateUserOtpApi event, emit) async {
    emit(
      state.copyWith(loginOtpResponse: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iAuthService.userRegisterOtpApi(phone: event.phone);

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            loginOtpResponse: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            loginOtpResponse: ApiResponse(
              status: ApiStatus.success,
              apiData: null,
            ),
          ),
        );
      },
    );
  }
}
