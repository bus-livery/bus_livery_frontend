part of 'profile_bloc.dart';

class ProfileState {
  final ApiResponse<ProfileModel> profileResponse;

  ProfileState({required this.profileResponse});

  factory ProfileState.initail() {
    return ProfileState(profileResponse: ApiResponse<ProfileModel>());
  }

  ProfileState copyWith({ApiResponse<ProfileModel>? profileResponse}) {
    return ProfileState(
      profileResponse: profileResponse ?? this.profileResponse,
    );
  }
}
