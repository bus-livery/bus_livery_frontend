part of 'horn_bloc.dart';

class HornState {
  final ApiResponse<HornDataModel> getAllHornsRes;
  final ApiResponse<List<HornModel>> getMyHornsRes;
  final ApiResponse<List<HornModel>> getOthersHornsRes;
  final ApiResponse<HornModel> hornCreateRes;
  final Map<int, bool> downloadsInProgress; // Track downloads by horn ID

  HornState({
    required this.getAllHornsRes,
    required this.getMyHornsRes,
    required this.getOthersHornsRes,
    required this.hornCreateRes,
    required this.downloadsInProgress,
  });

  factory HornState.initial() {
    return HornState(
      getAllHornsRes: ApiResponse<HornDataModel>(),
      getMyHornsRes: ApiResponse<List<HornModel>>(),
      getOthersHornsRes: ApiResponse<List<HornModel>>(),
      hornCreateRes: ApiResponse<HornModel>(),
      downloadsInProgress: {},
    );
  }

  HornState copyWith({
    ApiResponse<HornDataModel>? getAllHornsRes,
    ApiResponse<List<HornModel>>? getMyHornsRes,
    ApiResponse<List<HornModel>>? getOthersHornsRes,
    ApiResponse<HornModel>? hornCreateRes,
    Map<int, bool>? downloadsInProgress,
  }) {
    return HornState(
      getAllHornsRes: getAllHornsRes ?? this.getAllHornsRes,
      getMyHornsRes: getMyHornsRes ?? this.getMyHornsRes,
      getOthersHornsRes: getOthersHornsRes ?? this.getOthersHornsRes,
      hornCreateRes: hornCreateRes ?? this.hornCreateRes,
      downloadsInProgress: downloadsInProgress ?? this.downloadsInProgress,
    );
  }
}
