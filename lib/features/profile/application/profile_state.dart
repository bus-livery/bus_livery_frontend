part of 'profile_bloc.dart';

class ProfileState {
  final ApiResponse<ProfileModel> getProfileRes;
  final ApiResponse<String> updateProfileRes;
  final ApiResponse<List<LiveryModel>> getMyLiveryRes;
  final ApiResponse<List<LiveryModel>> getOthersLiveryRes;

  ProfileState({
    required this.getProfileRes,
    required this.updateProfileRes,
    required this.getMyLiveryRes,
    required this.getOthersLiveryRes,
  });

  factory ProfileState.initail() {
    return ProfileState(
      getProfileRes: ApiResponse<ProfileModel>(),
      updateProfileRes: ApiResponse<String>(),
      getMyLiveryRes: ApiResponse<List<LiveryModel>>(),
      getOthersLiveryRes: ApiResponse<List<LiveryModel>>(),
    );
  }

  ProfileState copyWith({
    ApiResponse<ProfileModel>? getProfileRes,
    ApiResponse<String>? updateProfileRes,
    ApiResponse<List<LiveryModel>>? getMyLiveryRes,
    ApiResponse<List<LiveryModel>>? getOthersLiveryRes,
  }) {
    return ProfileState(
      getProfileRes: getProfileRes ?? this.getProfileRes,
      updateProfileRes: updateProfileRes ?? this.updateProfileRes,
      getMyLiveryRes: getMyLiveryRes ?? this.getMyLiveryRes,
      getOthersLiveryRes: getOthersLiveryRes ?? this.getOthersLiveryRes,
    );
  }
}
