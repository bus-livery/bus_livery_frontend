part of 'top_users_bloc.dart';

class TopUsersState {
  final ApiResponse<List<ProfileModel>> getTopUsersRes;
  final bool isLoading;
  final String? error;

  TopUsersState({
    required this.getTopUsersRes,
    this.isLoading = false,
    this.error,
  });

  factory TopUsersState.initial() {
    return TopUsersState(getTopUsersRes: ApiResponse<List<ProfileModel>>());
  }

  TopUsersState copyWith({
    ApiResponse<List<ProfileModel>>? getTopUsersRes,
    bool? isLoading,
    String? error,
  }) {
    return TopUsersState(
      getTopUsersRes: getTopUsersRes ?? this.getTopUsersRes,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
