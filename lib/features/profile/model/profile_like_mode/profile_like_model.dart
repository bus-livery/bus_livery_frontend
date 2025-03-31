import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_like_model.freezed.dart';
part 'profile_like_model.g.dart';

@freezed
class ProfileLikeModel with _$ProfileLikeModel {
  factory ProfileLikeModel({
    String? message,
    @JsonKey(name: 'profile_liked') bool? profileLiked,
  }) = _ProfileLikeModel;

  factory ProfileLikeModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileLikeModelFromJson(json);
}
