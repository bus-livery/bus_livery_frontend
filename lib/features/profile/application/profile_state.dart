part of 'profile_bloc.dart';

class ProfileState {
  final ApiResponse<ProfileModel> getProfileRes;
  final ApiResponse<ProfileModel> getOtherProfileRes;
  final ApiResponse<List<ProfileModel>> getLikedProfiles;

  final ApiResponse<String> updateProfileRes;
  final ApiResponse<List<LiveryModel>> getMyLiveryRes;
  final ApiResponse<List<LiveryModel>> getOthersLiveryRes;
  final ApiResponse<ProfileLikeModel>? profileLikeRes;

  ProfileState({
    required this.getProfileRes,
    required this.getOtherProfileRes,
    required this.getLikedProfiles,
    required this.updateProfileRes,
    required this.getMyLiveryRes,
    required this.getOthersLiveryRes,
    required this.profileLikeRes,
  });

  factory ProfileState.initail() {
    return ProfileState(
      getProfileRes: ApiResponse<ProfileModel>(),
      getOtherProfileRes: ApiResponse<ProfileModel>(),
      getLikedProfiles: ApiResponse<List<ProfileModel>>(),
      updateProfileRes: ApiResponse<String>(),
      getMyLiveryRes: ApiResponse<List<LiveryModel>>(),
      getOthersLiveryRes: ApiResponse<List<LiveryModel>>(),
      profileLikeRes: ApiResponse<ProfileLikeModel>(),
    );
  }

  ProfileState copyWith({
    ApiResponse<ProfileModel>? getProfileRes,
    ApiResponse<ProfileModel>? getOtherProfileRes,
    ApiResponse<List<ProfileModel>>? getLikedProfiles,
    ApiResponse<String>? updateProfileRes,
    ApiResponse<List<LiveryModel>>? getMyLiveryRes,
    ApiResponse<List<LiveryModel>>? getOthersLiveryRes,
    ApiResponse<ProfileLikeModel>? profileLikeRes,
  }) {
    return ProfileState(
      getProfileRes: getProfileRes ?? this.getProfileRes,
      getOtherProfileRes: getOtherProfileRes ?? this.getOtherProfileRes,
      getLikedProfiles: getLikedProfiles ?? this.getLikedProfiles,
      updateProfileRes: updateProfileRes ?? this.updateProfileRes,
      getMyLiveryRes: getMyLiveryRes ?? this.getMyLiveryRes,
      getOthersLiveryRes: getOthersLiveryRes ?? this.getOthersLiveryRes,
      profileLikeRes: profileLikeRes ?? this.profileLikeRes,
    );
  }
}
