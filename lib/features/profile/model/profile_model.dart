import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    String? username,
    String? dp,
    String? phone,
    @JsonKey(name: 'county_code') int? countyCode,
    String? email,
    String? description,
    @JsonKey(name: 'profile_completed') bool? profileCompleted,
    @JsonKey(name: 'active_status') bool? activeStatus,
    @JsonKey(name: 'violation_count') int? violationCount,
    @JsonKey(name: 'like_count') int? likeCount,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
