// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_limit_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdLimitStatusModel _$AdLimitStatusModelFromJson(Map<String, dynamic> json) =>
    _AdLimitStatusModel(
      limit: (json['limit'] as num).toInt(),
      pointsEarnedToday: (json['points_earned_today'] as num).toInt(),
      reachedLimit: json['reached_limit'] as bool,
    );

Map<String, dynamic> _$AdLimitStatusModelToJson(_AdLimitStatusModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'points_earned_today': instance.pointsEarnedToday,
      'reached_limit': instance.reachedLimit,
    };
