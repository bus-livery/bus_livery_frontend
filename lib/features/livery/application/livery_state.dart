part of 'livery_bloc.dart';

class LiveryState {
  // API STATES
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<String> liveryDownloadRes;
  final ApiResponse<String> deleteLiveryRes;
  LiveryState({
    // API STATES
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.liveryDownloadRes,
    required this.deleteLiveryRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      // API STATES
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      liveryDownloadRes: ApiResponse<String>(),
      deleteLiveryRes: ApiResponse<String>(),
    );
  }

  LiveryState copyWith({
    List<String>? busModels,

    // API STATES
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<String>? liveryDownloadRes,
    ApiResponse<String>? deleteLiveryRes,
  }) {
    return LiveryState(
      // API STATES
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      liveryDownloadRes: liveryDownloadRes ?? this.liveryDownloadRes,
      deleteLiveryRes: deleteLiveryRes ?? this.deleteLiveryRes,
    );
  }
}
