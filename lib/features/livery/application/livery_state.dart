part of 'livery_bloc.dart';

class LiveryState {
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<String> liveryDownloadRes;
  LiveryState({
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.liveryDownloadRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      liveryDownloadRes: ApiResponse<String>(),
    );
  }

  LiveryState copyWith(
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<String>? liveryDownloadRes,
  ) {
    return LiveryState(
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      liveryDownloadRes: liveryDownloadRes ?? this.liveryDownloadRes,
    );
  }
}
