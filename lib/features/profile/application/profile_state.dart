part of 'profile_bloc.dart';

class ProfileState {
  final ApiResponse<ProfileModel> getProfileRes;
  final ApiResponse<ProfileModel> getOtherProfileRes;
  final ApiResponse<List<ProfileModel>> getLikedProfiles;

  final ApiResponse<String> updateProfileRes;
  final ApiResponse<List<LiveryModel>> getMyLiveryRes;
  final ApiResponse<List<LiveryModel>> getOthersLiveryRes;
  final ApiResponse<ProfileLikeModel>? profileLikeRes;
  final ApiResponse<int> watchAdRes;
  final ApiResponse<LeaderboardModel> leaderboardRes;
  final ApiResponse<AdLimitStatusModel> adLimitStatusRes;

  ProfileState({
    required this.getProfileRes,
    required this.getOtherProfileRes,
    required this.getLikedProfiles,
    required this.updateProfileRes,
    required this.getMyLiveryRes,
    required this.getOthersLiveryRes,
    required this.profileLikeRes,
    required this.watchAdRes,
    required this.leaderboardRes,
    required this.adLimitStatusRes,
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
      watchAdRes: ApiResponse<int>(),
      leaderboardRes: ApiResponse<LeaderboardModel>(),
      adLimitStatusRes: ApiResponse<AdLimitStatusModel>(),
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
    ApiResponse<int>? watchAdRes,
    ApiResponse<LeaderboardModel>? leaderboardRes,
    ApiResponse<AdLimitStatusModel>? adLimitStatusRes,
  }) {
    return ProfileState(
      getProfileRes: getProfileRes ?? this.getProfileRes,
      getOtherProfileRes: getOtherProfileRes ?? this.getOtherProfileRes,
      getLikedProfiles: getLikedProfiles ?? this.getLikedProfiles,
      updateProfileRes: updateProfileRes ?? this.updateProfileRes,
      getMyLiveryRes: getMyLiveryRes ?? this.getMyLiveryRes,
      getOthersLiveryRes: getOthersLiveryRes ?? this.getOthersLiveryRes,
      profileLikeRes: profileLikeRes ?? this.profileLikeRes,
      watchAdRes: watchAdRes ?? this.watchAdRes,
      leaderboardRes: leaderboardRes ?? this.leaderboardRes,
      adLimitStatusRes: adLimitStatusRes ?? this.adLimitStatusRes,
    );
  }
}
