import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_count_model.freezed.dart';
part 'download_count_model.g.dart';

@freezed
class DownloadCountModel with _$DownloadCountModel {
  factory DownloadCountModel({
    String? message,
    @JsonKey(name: 'livery_id') String? liveryId,
    @JsonKey(name: 'download_count') int? downloadCount,
  }) = _DownloadCountModel;

  factory DownloadCountModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadCountModelFromJson(json);
}
