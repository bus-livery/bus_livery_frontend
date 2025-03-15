// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livery_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveryReqModelImpl _$$LiveryReqModelImplFromJson(Map<String, dynamic> json) =>
    _$LiveryReqModelImpl(
      busType: json['bus_type'] as String?,
      busModel: json['bus_model'] as String?,
      postName: json['post_name'] as String?,
      description: json['description'] as String?,
      postImageOriginal: json['post_image_original'] as String?,
      postImage1080: json['post_image_1080'] as String?,
      postImage600: json['post_image_600'] as String?,
      postImage200: json['post_image_200'] as String?,
    );

Map<String, dynamic> _$$LiveryReqModelImplToJson(
  _$LiveryReqModelImpl instance,
) => <String, dynamic>{
  'bus_type': instance.busType,
  'bus_model': instance.busModel,
  'post_name': instance.postName,
  'description': instance.description,
  'post_image_original': instance.postImageOriginal,
  'post_image_1080': instance.postImage1080,
  'post_image_600': instance.postImage600,
  'post_image_200': instance.postImage200,
};
