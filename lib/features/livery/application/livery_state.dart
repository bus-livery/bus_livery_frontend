part of 'livery_bloc.dart';

class LiveryState {
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<String> liveryDownloadRes;
  final ApiResponse<LiveryModel> liveryCreateRes;
  LiveryState({
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.liveryDownloadRes,
    required this.liveryCreateRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      liveryDownloadRes: ApiResponse<String>(),
      liveryCreateRes: ApiResponse<LiveryModel>(),
    );
  }

  LiveryState copyWith({
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<String>? liveryDownloadRes,
    ApiResponse<LiveryModel>? liveryCreateRes,
  }) {
    return LiveryState(
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      liveryDownloadRes: liveryDownloadRes ?? this.liveryDownloadRes,
      liveryCreateRes: liveryCreateRes ?? this.liveryCreateRes,
    );
  }
}
