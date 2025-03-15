part of 'livery_create_bloc.dart';

class LiveryCreateState {
  final List<String> busModels;

  // API STATES
  final ApiResponse<LiveryReqModel> liveryCreateRes;
  // Bus Types
  final ApiResponse<List<BusTypeModel>> busTypesRes;
  LiveryCreateState({
    required this.busModels,

    // API STATES
    required this.liveryCreateRes,
    required this.busTypesRes,
  });

  factory LiveryCreateState.initial() {
    return LiveryCreateState(
      busModels: <String>[],

      // API STATES
      liveryCreateRes: ApiResponse<LiveryReqModel>(apiData: LiveryReqModel()),
      busTypesRes: ApiResponse<List<BusTypeModel>>(),
    );
  }

  LiveryCreateState copyWith({
    List<String>? busModels,

    // API STATES
    ApiResponse<LiveryReqModel>? liveryCreateRes,
    ApiResponse<List<BusTypeModel>>? busTypesRes,
  }) {
    return LiveryCreateState(
      busModels: busModels ?? this.busModels,

      // API STATES
      liveryCreateRes: liveryCreateRes ?? this.liveryCreateRes,
      busTypesRes: busTypesRes ?? this.busTypesRes,
    );
  }
}
