part of 'livery_bloc.dart';

class LiveryState {
  // API STATES
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<List<LiveryModel>> getLiveryDownloads;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<DownloadCountModel> downloadCountRes;
  final ApiResponse<String> deleteLiveryRes;
  LiveryState({
    // API STATES
    required this.getAllLiveryRes,
    required this.getLiveryDownloads,
    required this.getSingleLiveryRes,
    required this.downloadCountRes,
    required this.deleteLiveryRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      // API STATES
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getLiveryDownloads: ApiResponse<List<LiveryModel>>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      downloadCountRes: ApiResponse<DownloadCountModel>(),
      deleteLiveryRes: ApiResponse<String>(),
    );
  }

  LiveryState copyWith({
    List<String>? busModels,

    // API STATES
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<List<LiveryModel>>? getLiveryDownloads,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<DownloadCountModel>? downloadCountRes,
    ApiResponse<String>? deleteLiveryRes,
  }) {
    return LiveryState(
      // API STATES
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      getLiveryDownloads: getLiveryDownloads ?? this.getLiveryDownloads,
      downloadCountRes: downloadCountRes ?? this.downloadCountRes,
      deleteLiveryRes: deleteLiveryRes ?? this.deleteLiveryRes,
    );
  }
}
