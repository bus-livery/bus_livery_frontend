import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_type_model.freezed.dart';
part 'bus_type_model.g.dart';

@freezed
class BusTypeModel with _$BusTypeModel {
  factory BusTypeModel({
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_models') List<String>? busModels,
  }) = _BusTypeModel;

  factory BusTypeModel.fromJson(Map<String, dynamic> json) =>
      _$BusTypeModelFromJson(json);
}
