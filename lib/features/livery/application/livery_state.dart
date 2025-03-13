part of 'livery_bloc.dart';

class LiveryState {
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<String> liveryDownloadRes;
  final ApiResponse<LiveryModel> liveryCreateRes;
  // Bus Types
  final ApiResponse<List<BusTypeModel>> busTypesRes;
  LiveryState({
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.liveryDownloadRes,
    required this.liveryCreateRes,
    required this.busTypesRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      liveryDownloadRes: ApiResponse<String>(),
      liveryCreateRes: ApiResponse<LiveryModel>(),
      busTypesRes: ApiResponse<List<BusTypeModel>>(),
    );
  }

  LiveryState copyWith({
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<String>? liveryDownloadRes,
    ApiResponse<LiveryModel>? liveryCreateRes,
    ApiResponse<List<BusTypeModel>>? busTypesRes,
  }) {
    return LiveryState(
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      liveryDownloadRes: liveryDownloadRes ?? this.liveryDownloadRes,
      liveryCreateRes: liveryCreateRes ?? this.liveryCreateRes,
      busTypesRes: busTypesRes ?? this.busTypesRes,
    );
  }
}
