// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livery_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveryDateModelImpl _$$LiveryDateModelImplFromJson(
  Map<String, dynamic> json,
) => _$LiveryDateModelImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => LiveryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  message: json['message'] as String?,
  totalCount: (json['total_count'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
  currentPages: (json['current_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$$LiveryDateModelImplToJson(
  _$LiveryDateModelImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'total_count': instance.totalCount,
  'per_page': instance.perPage,
  'total_pages': instance.totalPages,
  'current_page': instance.currentPages,
};
