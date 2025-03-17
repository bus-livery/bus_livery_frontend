// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveryImageModelImpl _$$LiveryImageModelImplFromJson(
  Map<String, dynamic> json,
) => _$LiveryImageModelImpl(
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
  liveryImageOriginal: json['livery_image_original'] as String?,
  liveryImage1080: json['livery_image_1080'] as String?,
  livertImage600: json['livery_image_600'] as String?,
  liveryImage200: json['livery_image_200'] as String?,
);

Map<String, dynamic> _$$LiveryImageModelImplToJson(
  _$LiveryImageModelImpl instance,
) => <String, dynamic>{
  'ID': instance.id,
  'CreatedAt': instance.createdAt?.toIso8601String(),
  'UpdatedAt': instance.updatedAt?.toIso8601String(),
  'DeletedAt': instance.deletedAt,
  'livery_image_original': instance.liveryImageOriginal,
  'livery_image_1080': instance.liveryImage1080,
  'livery_image_600': instance.livertImage600,
  'livery_image_200': instance.liveryImage200,
};
