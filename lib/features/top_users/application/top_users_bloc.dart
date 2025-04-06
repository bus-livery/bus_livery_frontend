import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/features/top_users/service/top_users_service.dart';

part 'top_users_event.dart';
part 'top_users_state.dart';

@injectable
class TopUsersBloc extends Bloc<TopUsersEvent, TopUsersState> {
  final ITopUsersService _topUsersService;

  TopUsersBloc(this._topUsersService) : super(TopUsersState.initial()) {
    on<FetchTopUsers>(_onFetchTopUsers);
  }

  Future<void> _onFetchTopUsers(
    FetchTopUsers event,
    Emitter<TopUsersState> emit,
  ) async {
    emit(
      state.copyWith(
        getTopUsersRes: state.getTopUsersRes.copyWith(
          status: ApiStatus.loading,
          errorMessage: null,
        ),
      ),
    );

    final result = await _topUsersService.fetchTopUsers();
    result.fold(
      (error) => emit(
        state.copyWith(
          getTopUsersRes: state.getTopUsersRes.copyWith(
            status: ApiStatus.failure,
            errorMessage: error,
          ),
        ),
      ),
      (users) => emit(
        state.copyWith(
          getTopUsersRes: ApiResponse<List<ProfileModel>>(
            status: ApiStatus.success,
            apiData: users,
          ),
        ),
      ),
    );
  }
}
