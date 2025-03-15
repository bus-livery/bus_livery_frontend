part of 'livery_bloc.dart';

class LiveryState {
  // API STATES
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<String> liveryDownloadRes;
  LiveryState({
    // API STATES
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.liveryDownloadRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      // API STATES
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      liveryDownloadRes: ApiResponse<String>(),
    );
  }

  LiveryState copyWith({
    List<String>? busModels,

    // API STATES
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<String>? liveryDownloadRes,
  }) {
    return LiveryState(
      // API STATES
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      liveryDownloadRes: liveryDownloadRes ?? this.liveryDownloadRes,
    );
  }
}
