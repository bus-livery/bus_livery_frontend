// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImageModelImpl _$$PostImageModelImplFromJson(Map<String, dynamic> json) =>
    _$PostImageModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      createdAt:
          json['CreatedAt'] == null
              ? null
              : DateTime.parse(json['CreatedAt'] as String),
      updatedAt:
          json['UpdatedAt'] == null
              ? null
              : DateTime.parse(json['UpdatedAt'] as String),
      deletedAt: json['DeletedAt'],
      postImageOriginal: json['post_image_original'] as String?,
      postImage1080: json['post_image_1080'] as String?,
      postImage600: json['post_image_600'] as String?,
      postImage200: json['post_image_200'] as String?,
    );

Map<String, dynamic> _$$PostImageModelImplToJson(
  _$PostImageModelImpl instance,
) => <String, dynamic>{
  'ID': instance.id,
  'CreatedAt': instance.createdAt?.toIso8601String(),
  'UpdatedAt': instance.updatedAt?.toIso8601String(),
  'DeletedAt': instance.deletedAt,
  'post_image_original': instance.postImageOriginal,
  'post_image_1080': instance.postImage1080,
  'post_image_600': instance.postImage600,
  'post_image_200': instance.postImage200,
};
