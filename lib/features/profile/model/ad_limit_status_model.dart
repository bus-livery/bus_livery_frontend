import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_limit_status_model.freezed.dart';
part 'ad_limit_status_model.g.dart';

@freezed
abstract class AdLimitStatusModel with _$AdLimitStatusModel {
  factory AdLimitStatusModel({
    required int limit,
    @JsonKey(name: 'points_earned_today') required int pointsEarnedToday,
    @JsonKey(name: 'reached_limit') required bool reachedLimit,
  }) = _AdLimitStatusModel;

  factory AdLimitStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AdLimitStatusModelFromJson(json);
}
