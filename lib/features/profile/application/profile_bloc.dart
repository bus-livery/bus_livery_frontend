import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/features/profile/service/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileService iProfileService;

  ProfileBloc(this.iProfileService) : super(ProfileState.initail()) {
    on<ProfileEvent>((event, emit) {});

    on<ProfileGetMyApi>(_profileGetMyApi);
  }

  _profileGetMyApi(ProfileGetMyApi event, emit) async {
    emit(
      state.copyWith(profileResponse: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iProfileService.getMyProfileApi();

    return response.fold(
      //
      (failure) {
        var sample = state.profileResponse;

        emit(
          state.copyWith(
            profileResponse: ApiResponse(
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
            profileResponse: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }
}
