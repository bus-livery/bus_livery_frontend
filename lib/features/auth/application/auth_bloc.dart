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

    on<AuthPassVisibleEvent>(_authPassVisible);

    on<AuthOtpGenerateApi>(_authOtpGenerateApi);

    on<AuthloginOtpApi>(_authloginOtpApi);

    on<AuthCreateUserOtpApi>(_authCreateUserOtpApi);
  }

  final TextEditingController phoneCtr = TextEditingController();
  final TextEditingController otpCtr = TextEditingController();

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
    phoneCtr.dispose();
    otpCtr.dispose();
    super.close();
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
