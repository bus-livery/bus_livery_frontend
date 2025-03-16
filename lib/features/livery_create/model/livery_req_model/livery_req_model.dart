import 'package:freezed_annotation/freezed_annotation.dart';

part 'livery_req_model.freezed.dart';
part 'livery_req_model.g.dart';

@freezed
class LiveryReqModel with _$LiveryReqModel {
  factory LiveryReqModel({
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_model') String? busModel,
    @JsonKey(name: 'post_name') String? postName,
    String? description,
    @JsonKey(name: 'post_image_original') String? postImageOriginal,
    @JsonKey(name: 'post_image_1080') String? postImage1080,
    @JsonKey(name: 'post_image_600') String? postImage600,
    @JsonKey(name: 'post_image_200') String? postImage200,
  }) = _LiveryReqModel;

  factory LiveryReqModel.fromJson(Map<String, dynamic> json) =>
      _$LiveryReqModelFromJson(json);
}
