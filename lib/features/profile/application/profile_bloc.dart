import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/profile/model/profile_like_mode/profile_like_model.dart';
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

    on<ProfileGetOtherApiEvent>(_profileGetOtherApiEvent);

    on<UpdateMyProfileEvent>(_updatesMyProfileEvent);

    on<GetMyLiveryApiEvent>(_getMyLiveryApiEvent);

    on<GetOthersLiveryApiEvent>(_getOthersLiveryApiEvent);

    on<LikeProfileApiEvent>(_likeProfileApiEvent);
  }

  @override
  void initstate() {
    customPrint('PROFILE BLOC REGISTERED');
    WidgetsBinding.instance.addPostFrameCallback((v) {
      add(ProfileGetMyApiEvent());
      add(GetMyLiveryApiEvent());
    });
  }

  @override
  Future<void> close() {
    customPrint('PROFILE BLOC CLOSED');
    state.getProfileRes.apiData?.dispose();
    return super.close();
  }

  _profileGetMyApi(ProfileGetMyApiEvent event, emit) async {
    emit(state.copyWith(getProfileRes: ApiResponse(status: ApiStatus.loading)));

    final response = await iProfileService.getMyProfileApi();

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getProfileRes: ApiResponse(
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
            getProfileRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success.assignToControllers(),
            ),
          ),
        );
      },
    );
  }

  _profileGetOtherApiEvent(ProfileGetOtherApiEvent event, emit) async {
    emit(
      state.copyWith(
        getOtherProfileRes: ApiResponse(status: ApiStatus.loading),
        profileLikeRes: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await iProfileService.getOtherProfileApi(
      userId: event.userId,
    );

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getOtherProfileRes: ApiResponse(
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
            getOtherProfileRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success.assignToControllers(),
            ),
            profileLikeRes: ApiResponse(
              status: ApiStatus.success,
              apiData: ProfileLikeModel(profileLiked: success.profileLiked),
            ),
          ),
        );
      },
    );
  }

  _updatesMyProfileEvent(UpdateMyProfileEvent event, emit) async {
    emit(
      state.copyWith(updateProfileRes: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iProfileService.updateMyProfileApi(event.data);

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            updateProfileRes: ApiResponse(
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
            updateProfileRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _getMyLiveryApiEvent(GetMyLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(getMyLiveryRes: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iProfileService.fetchMyLiveryApi();

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getMyLiveryRes: ApiResponse(
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
            getMyLiveryRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _getOthersLiveryApiEvent(GetOthersLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(
        getOthersLiveryRes: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await iProfileService.fetchOthersLiveryApi(
      userId: event.userId,
    );

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getOthersLiveryRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
              apiData: null,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            getOthersLiveryRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _likeProfileApiEvent(LikeProfileApiEvent event, emit) async {
    emit(
      state.copyWith(profileLikeRes: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await iProfileService.likeProfileApi(userId: event.userId);

    return response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            profileLikeRes: ApiResponse(
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
            profileLikeRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
              errorMessage: null,
            ),
          ),
        );
      },
    );
  }
}
