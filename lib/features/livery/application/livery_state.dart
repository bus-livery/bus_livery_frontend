part of 'livery_bloc.dart';

class LiveryState {
  final List<String> busModels;

  // API STATES
  final ApiResponse<LiveryDateModel> getAllLiveryRes;
  final ApiResponse<LiveryModel> getSingleLiveryRes;
  final ApiResponse<String> liveryDownloadRes;
  final ApiResponse<LiveryModel> liveryCreateRes;
  // Bus Types
  final ApiResponse<List<BusTypeModel>> busTypesRes;
  LiveryState({
    required this.busModels,

    // API STATES
    required this.getAllLiveryRes,
    required this.getSingleLiveryRes,
    required this.liveryDownloadRes,
    required this.liveryCreateRes,
    required this.busTypesRes,
  });

  factory LiveryState.initial() {
    return LiveryState(
      busModels: <String>[],

      // API STATES
      getAllLiveryRes: ApiResponse<LiveryDateModel>(),
      getSingleLiveryRes: ApiResponse<LiveryModel>(),
      liveryDownloadRes: ApiResponse<String>(),
      liveryCreateRes: ApiResponse<LiveryModel>(),
      busTypesRes: ApiResponse<List<BusTypeModel>>(),
    );
  }

  LiveryState copyWith({
    List<String>? busModels,

    // API STATES
    ApiResponse<LiveryDateModel>? getAllLiveryRes,
    ApiResponse<LiveryModel>? getSingleLiveryRes,
    ApiResponse<String>? liveryDownloadRes,
    ApiResponse<LiveryModel>? liveryCreateRes,
    ApiResponse<List<BusTypeModel>>? busTypesRes,
  }) {
    return LiveryState(
      busModels: busModels ?? this.busModels,

      // API STATES
      getSingleLiveryRes: getSingleLiveryRes ?? this.getSingleLiveryRes,
      getAllLiveryRes: getAllLiveryRes ?? this.getAllLiveryRes,
      liveryDownloadRes: liveryDownloadRes ?? this.liveryDownloadRes,
      liveryCreateRes: liveryCreateRes ?? this.liveryCreateRes,
      busTypesRes: busTypesRes ?? this.busTypesRes,
    );
  }
}
