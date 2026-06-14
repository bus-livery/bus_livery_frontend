// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HornModel _$HornModelFromJson(Map<String, dynamic> json) => _HornModel(
  id: (json['ID'] as num?)?.toInt(),
  createdAt: json['CreatedAt'] == null
      ? null
      : DateTime.parse(json['CreatedAt'] as String),
  updatedAt: json['UpdatedAt'] == null
      ? null
      : DateTime.parse(json['UpdatedAt'] as String),
  deletedAt: json['DeletedAt'],
  userId: (json['user_id'] as num?)?.toInt(),
  user: json['user'] == null
      ? null
      : ProfileModel.fromJson(json['user'] as Map<String, dynamic>),
  audioPath: json['audio_path'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  duration: (json['duration'] as num?)?.toDouble(),
  size: (json['size'] as num?)?.toInt(),
  approvalStatus: json['approval_status'] as String?,
);

Map<String, dynamic> _$HornModelToJson(_HornModel instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt?.toIso8601String(),
      'UpdatedAt': instance.updatedAt?.toIso8601String(),
      'DeletedAt': instance.deletedAt,
      'user_id': instance.userId,
      'user': instance.user,
      'audio_path': instance.audioPath,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'size': instance.size,
      'approval_status': instance.approvalStatus,
    };
