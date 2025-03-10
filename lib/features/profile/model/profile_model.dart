import 'package:flutter/material.dart';
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
    @JsonKey(name: 'county_code') int? countryCode,
    String? email,
    String? description,
    @JsonKey(name: 'profile_completed') bool? profileCompleted,
    @JsonKey(name: 'active_status') bool? activeStatus,
    @JsonKey(name: 'violation_count') int? violationCount,
    @JsonKey(name: 'like_count') int? likeCount,

    // Username Controller
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? usernameCtr,

    // Country code Controller
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? countryCodeCtr,

    // Phone Number Controller
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? phoneNoCtr,

    // Email Controller
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? emailCtr,

    // Description Controller
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? descriptionCtr,
    //,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.initail() {
    return ProfileModel(
      usernameCtr: TextEditingController(),
      countryCodeCtr: TextEditingController(),
      phoneNoCtr: TextEditingController(),
      emailCtr: TextEditingController(),
      descriptionCtr: TextEditingController(),
    );
  }
}

extension ProfileModelUpdates on ProfileModel {
  ProfileModel profileModelUpdates() {
    return copyWith(
      usernameCtr: usernameCtr?..text = username ?? '',
      countryCodeCtr: countryCodeCtr?..text = countryCode.toString(),
      phoneNoCtr: phoneNoCtr?..text = phone ?? '',
      emailCtr: emailCtr?..text = email ?? '',
      descriptionCtr: descriptionCtr?..text = description ?? '',
    );
  }
}
