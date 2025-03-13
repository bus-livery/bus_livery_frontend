import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_image_model.freezed.dart';
part 'post_image_model.g.dart';

@freezed
class PostImageModel with _$PostImageModel {
  factory PostImageModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'post_image_original') String? postImageOriginal,
    @JsonKey(name: 'post_image_1080') String? postImage1080,
    @JsonKey(name: 'post_image_600') String? postImage600,
    @JsonKey(name: 'post_image_200') String? postImage200,
  }) = _PostImageModel;

  factory PostImageModel.fromJson(Map<String, dynamic> json) =>
      _$PostImageModelFromJson(json);
}
