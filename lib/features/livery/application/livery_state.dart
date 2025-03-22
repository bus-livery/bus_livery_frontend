part of 'livery_bloc.dart';

class LiveryState {
  // API STATES
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<DownloadCountModel> downloadCountRes;
  final ApiResponse<String> deleteLiveryRes;
  LiveryState({
    // API STATES
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.downloadCountRes,
    required this.deleteLiveryRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      // API STATES
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      downloadCountRes: ApiResponse<DownloadCountModel>(),
      deleteLiveryRes: ApiResponse<String>(),
    );
  }

  LiveryState copyWith({
    List<String>? busModels,

    // API STATES
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<DownloadCountModel>? downloadCountRes,
    ApiResponse<String>? deleteLiveryRes,
  }) {
    return LiveryState(
      // API STATES
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      downloadCountRes: downloadCountRes ?? this.downloadCountRes,
      deleteLiveryRes: deleteLiveryRes ?? this.deleteLiveryRes,
    );
  }
}
