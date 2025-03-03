import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initial()) {
    on<AuthEvent>((event, emit) {});

    on<_PasswordVisible>(
      (event, emit) => emit(state.copyWith(showPassword: !state.showPassword)),
    );
  }
}
