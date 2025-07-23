import 'package:freezed_annotation/freezed_annotation.dart';

import 'livery_model.dart';

part 'livery_data_model.freezed.dart';
part 'livery_data_model.g.dart';

@freezed
class LiveryDateModel with _$LiveryDateModel {
  factory LiveryDateModel({
    List<LiveryModel>? data,
    String? message,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'current_page') int? currentPages,
  }) = _LiveryDateModel;

  factory LiveryDateModel.fromJson(Map<String, dynamic> json) =>
      _$LiveryDateModelFromJson(json);
}
