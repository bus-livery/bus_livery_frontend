// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
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
      username: json['username'] as String?,
      dp: json['dp'] as String?,
      phone: json['phone'] as String?,
      countryCode: json['country_code'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      profileCompleted: json['profile_completed'] as bool?,
      activeStatus: json['active_status'] as bool?,
      violationCount: (json['violation_count'] as num?)?.toInt(),
      likeCount: (json['like_count'] as num?)?.toInt(),
      profileLiked: json['profile_liked'] as bool?,
      totalLivery: (json['total_livery'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt?.toIso8601String(),
      'UpdatedAt': instance.updatedAt?.toIso8601String(),
      'DeletedAt': instance.deletedAt,
      'username': instance.username,
      'dp': instance.dp,
      'phone': instance.phone,
      'country_code': instance.countryCode,
      'email': instance.email,
      'description': instance.description,
      'profile_completed': instance.profileCompleted,
      'active_status': instance.activeStatus,
      'violation_count': instance.violationCount,
      'like_count': instance.likeCount,
      'profile_liked': instance.profileLiked,
      'total_livery': instance.totalLivery,
    };
