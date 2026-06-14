import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livery/features/profile/model/profile_model.dart';

part 'horn_model.freezed.dart';
part 'horn_model.g.dart';

@freezed
abstract class HornModel with _$HornModel {
  factory HornModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'user_id') int? userId,
    ProfileModel? user,
    @JsonKey(name: 'audio_path') required String audioPath,
    required String title,
    String? description,
    double? duration,
    int? size,
    @JsonKey(name: 'approval_status') String? approvalStatus,
  }) = _HornModel;

  factory HornModel.fromJson(Map<String, dynamic> json) =>
      _$HornModelFromJson(json);
}
