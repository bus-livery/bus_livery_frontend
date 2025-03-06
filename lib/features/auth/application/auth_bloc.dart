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
    on<AuthEvent>((event, emit) {});

    on<PasswordVisibleToggled>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));

      // Handle other events here

      customPrint('print2');
    });

    on<AuthOtpGenerateApi>(_authOtpGenerateApi);

    on<AuthLoginApi>(_authLoginApi);
  }

  _authOtpGenerateApi(AuthOtpGenerateApi event, emit) async {
    emit(state.copyWith(otpResponse: ApiResponse(status: ApiStatus.loading)));

    final response = await iAuthService.otpGenerate(email: event.email);

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

  _authLoginApi(AuthLoginApi event, emit) async {
    emit(state.copyWith(loginResponse: ApiResponse(status: ApiStatus.loading)));

    final response = await iAuthService.loginApi(
      email: event.email,
      otp: event.otp,
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
}
