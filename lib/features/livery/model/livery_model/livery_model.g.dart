// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveryModelImpl _$$LiveryModelImplFromJson(Map<String, dynamic> json) =>
    _$LiveryModelImpl(
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
      busType: json['bus_type'] as String?,
      busModel: json['bus_model'] as String?,
      liveryName: json['livery_name'] as String?,
      description: json['description'] as String?,
      downloadCount: (json['download_count'] as num?)?.toInt(),
      user:
          json['user'] == null
              ? null
              : ProfileModel.fromJson(json['user'] as Map<String, dynamic>),
      postImage:
          json['livery_image'] == null
              ? null
              : LiveryImageModel.fromJson(
                json['livery_image'] as Map<String, dynamic>,
              ),
      approvalStatus: json['approval_status'] as String?,
    );

Map<String, dynamic> _$$LiveryModelImplToJson(_$LiveryModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt?.toIso8601String(),
      'UpdatedAt': instance.updatedAt?.toIso8601String(),
      'DeletedAt': instance.deletedAt,
      'bus_type': instance.busType,
      'bus_model': instance.busModel,
      'livery_name': instance.liveryName,
      'description': instance.description,
      'download_count': instance.downloadCount,
      'user': instance.user,
      'livery_image': instance.postImage,
      'approval_status': instance.approvalStatus,
    };
