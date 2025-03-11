import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livery/features/profile/model/profile_model.dart';

import 'post_image_model.dart';

part 'livery_model.freezed.dart';
part 'livery_model.g.dart';

@freezed
class LiveryModel with _$LiveryModel {
  factory LiveryModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_model') String? busModel,
    @JsonKey(name: 'post_name') String? postName,
    String? description,
    @JsonKey(name: 'download_count') int? downloadCount,
    ProfileModel? user,
    @JsonKey(name: 'post_image') PostImageModel? postImage,
  }) = _LiveryModel;

  factory LiveryModel.fromJson(Map<String, dynamic> json) =>
      _$LiveryModelFromJson(json);
}
