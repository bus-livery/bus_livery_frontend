import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
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

    on<OtpGenerateEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));

      final response = await iAuthService.otpGenerate(email: event.email);

      return response.fold(
        //
        (failure) {
          emit(
            state.copyWith(status: AuthStatus.failure, errorMessage: failure),
          );
        },
        //
        (success) {
          emit(state.copyWith(status: AuthStatus.success));
        },
      );
    });
  }
}
