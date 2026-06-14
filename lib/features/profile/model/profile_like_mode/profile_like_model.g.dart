// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileLikeModel _$ProfileLikeModelFromJson(Map<String, dynamic> json) =>
    _ProfileLikeModel(
      message: json['message'] as String?,
      profileLiked: json['profile_liked'] as bool?,
    );

Map<String, dynamic> _$ProfileLikeModelToJson(_ProfileLikeModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'profile_liked': instance.profileLiked,
    };
