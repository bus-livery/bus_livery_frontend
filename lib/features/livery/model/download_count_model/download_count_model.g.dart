// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadCountModelImpl _$$DownloadCountModelImplFromJson(
  Map<String, dynamic> json,
) => _$DownloadCountModelImpl(
  message: json['message'] as String?,
  liveryId: json['livery_id'] as String?,
  downloadCount: (json['download_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$$DownloadCountModelImplToJson(
  _$DownloadCountModelImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'livery_id': instance.liveryId,
  'download_count': instance.downloadCount,
};
