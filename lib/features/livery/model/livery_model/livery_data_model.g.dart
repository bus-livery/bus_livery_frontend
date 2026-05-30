// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livery_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiveryDateModel _$LiveryDateModelFromJson(Map<String, dynamic> json) =>
    _LiveryDateModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LiveryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalCount: (json['total_count'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      currentPages: (json['current_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LiveryDateModelToJson(_LiveryDateModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'total_count': instance.totalCount,
      'per_page': instance.perPage,
      'total_pages': instance.totalPages,
      'current_page': instance.currentPages,
    };
