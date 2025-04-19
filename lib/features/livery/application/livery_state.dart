part of 'livery_bloc.dart';

class LiveryState {
  final LiveryFilter filter;
  final int gridColumns; // 1 for list view, 2 for grid view
  final Map<String, bool> uploadsInProgress; // Track uploads in progress
  // API STATES
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<List<LiveryModel>> getLiveryDownloads;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<DownloadCountModel> downloadCountRes;
  final ApiResponse<String> deleteLiveryRes;
  LiveryState({
    required this.filter,
    required this.gridColumns,
    required this.uploadsInProgress,
    // API STATES
    required this.getAllLiveryRes,
    required this.getLiveryDownloads,
    required this.getSingleLiveryRes,
    required this.downloadCountRes,
    required this.deleteLiveryRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      filter: LiveryFilter.latest,
      gridColumns: 1, // Default to list view
      uploadsInProgress: {}, // Initialize empty map
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
    LiveryFilter? filter,
    int? gridColumns,
    Map<String, bool>? uploadsInProgress,
    // API STATES
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<List<LiveryModel>>? getLiveryDownloads,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<DownloadCountModel>? downloadCountRes,
    ApiResponse<String>? deleteLiveryRes,
  }) {
    return LiveryState(
      filter: filter ?? this.filter,
      gridColumns: gridColumns ?? this.gridColumns,
      uploadsInProgress: uploadsInProgress ?? this.uploadsInProgress,
      // API STATES
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      getLiveryDownloads: getLiveryDownloads ?? this.getLiveryDownloads,
      downloadCountRes: downloadCountRes ?? this.downloadCountRes,
      deleteLiveryRes: deleteLiveryRes ?? this.deleteLiveryRes,
    );
  }
}
