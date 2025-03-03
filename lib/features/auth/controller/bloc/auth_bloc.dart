import 'package:bloc/bloc.dart';
import 'package:livery/utils/custom_print.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is PasswordVisibleToggled) {
        // emit(state.copyWith(showPassword: !state.showPassword));

        customPrint(content: 'print1');
      }
      // Handle other events here
    });

    on<PasswordVisibleToggled>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));

      // Handle other events here

      customPrint(content: 'print2');
    });
  }
}
