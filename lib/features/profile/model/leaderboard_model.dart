import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_model.freezed.dart';
part 'leaderboard_model.g.dart';

@freezed
abstract class LeaderboardEntry with _$LeaderboardEntry {
  factory LeaderboardEntry({
    required int id,
    required String username,
    String? dp,
    required int points,
    required int rank,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);
}

@freezed
abstract class LeaderboardModel with _$LeaderboardModel {
  factory LeaderboardModel({
    @JsonKey(name: 'current_user_rank') required int currentUserRank,
    @JsonKey(name: 'current_user_points') required int currentUserPoints,
    required List<LeaderboardEntry> data,
  }) = _LeaderboardModel;

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardModelFromJson(json);
}
