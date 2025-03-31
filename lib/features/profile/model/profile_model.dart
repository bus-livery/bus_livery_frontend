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
    @JsonKey(name: 'profile_liked') bool? profileLiked,

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

  // factory ProfileModel.initail() {
  //   return ProfileModel(
  //     usernameCtr: TextEditingController(text: 'asd'),
  //     countryCodeCtr: TextEditingController(),
  //     phoneNoCtr: TextEditingController(),
  //     emailCtr: TextEditingController(),
  //     descriptionCtr: TextEditingController(),
  //   );
  // }
}

extension ProfileModelUpdates on ProfileModel {
  ProfileModel assignToControllers() {
    return copyWith(
      usernameCtr: TextEditingController(text: username),
      countryCodeCtr: TextEditingController(text: countryCode.toString()),
      phoneNoCtr: TextEditingController(text: phone),
      emailCtr: TextEditingController(text: email),
      descriptionCtr: TextEditingController(text: description),
    );
  }

  ProfileModel profileToApi() {
    return ProfileModel(
      username: usernameCtr?.text,
      countryCode: int.tryParse(countryCodeCtr?.text ?? ''),
      phone: phoneNoCtr?.text,
      email: emailCtr?.text,
      description: descriptionCtr?.text,
    );
  }

  void dispose() {
    usernameCtr?.dispose();
    countryCodeCtr?.dispose();
    phoneNoCtr?.dispose();
    emailCtr?.dispose();
    descriptionCtr?.dispose();
  }
}
