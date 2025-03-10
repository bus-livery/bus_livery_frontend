import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/features/profile/service/profile_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> with BlocLifeCycle {
  final IProfileService iProfileService;

  ProfileBloc(this.iProfileService) : super(ProfileState.initail()) {
    //
    initstate();
    //
    on<ProfileEvent>((event, emit) {});

    on<ProfileGetMyApiEvent>(_profileGetMyApi);
  }

  @override
  void initstate() {
    customPrint('PROFILE BLOC REGISTERED');
    WidgetsBinding.instance.addPostFrameCallback(
      (v) => add(ProfileGetMyApiEvent()),
    );
  }

  @override
  Future<void> close() {
    customPrint('PROFILE BLOC CLOSED');
    return super.close();
  }

  _profileGetMyApi(ProfileGetMyApiEvent event, emit) async {
    emit(
      state.copyWith(profileResponse: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iProfileService.getMyProfileApi();

    return response.fold(
      //
      (failure) {
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
