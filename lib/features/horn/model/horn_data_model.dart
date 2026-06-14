import 'package:freezed_annotation/freezed_annotation.dart';
import 'horn_model.dart';

part 'horn_data_model.freezed.dart';
part 'horn_data_model.g.dart';

@freezed
abstract class HornDataModel with _$HornDataModel {
  factory HornDataModel({
    List<HornModel>? data,
    String? message,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'current_page') int? currentPages,
  }) = _HornDataModel;

  factory HornDataModel.fromJson(Map<String, dynamic> json) =>
      _$HornDataModelFromJson(json);
}
