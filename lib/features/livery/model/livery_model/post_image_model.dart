import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_image_model.freezed.dart';
part 'post_image_model.g.dart';

@freezed
class LiveryImageModel with _$LiveryImageModel {
  factory LiveryImageModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'livery_image_original') String? liveryImageOriginal,
    @JsonKey(name: 'livery_image_1080') String? liveryImage1080,
    @JsonKey(name: 'livery_image_600') String? livertImage600,
    @JsonKey(name: 'livery_image_200') String? liveryImage200,
  }) = _LiveryImageModel;

  factory LiveryImageModel.fromJson(Map<String, dynamic> json) =>
      _$LiveryImageModelFromJson(json);
}
