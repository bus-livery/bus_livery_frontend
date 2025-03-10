part of 'profile_bloc.dart';

class ProfileState {
  final ApiResponse<ProfileModel> getProfileRes;
  final ApiResponse<String> updateProfileRes;

  ProfileState({required this.getProfileRes, required this.updateProfileRes});

  factory ProfileState.initail() {
    return ProfileState(
      getProfileRes: ApiResponse<ProfileModel>(),
      updateProfileRes: ApiResponse<String>(),
    );
  }

  ProfileState copyWith({
    ApiResponse<ProfileModel>? getProfileRes,
    ApiResponse<String>? updateProfileRes,
  }) {
    return ProfileState(
      getProfileRes: getProfileRes ?? this.getProfileRes,
      updateProfileRes: updateProfileRes ?? this.updateProfileRes,
    );
  }
}
