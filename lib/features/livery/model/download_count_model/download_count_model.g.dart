// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadCountModel _$DownloadCountModelFromJson(Map<String, dynamic> json) =>
    _DownloadCountModel(
      message: json['message'] as String?,
      liveryId: json['livery_id'] as String?,
      downloadCount: (json['download_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DownloadCountModelToJson(_DownloadCountModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'livery_id': instance.liveryId,
      'download_count': instance.downloadCount,
    };
