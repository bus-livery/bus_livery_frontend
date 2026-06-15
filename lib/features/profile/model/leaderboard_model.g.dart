// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _LeaderboardEntry(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      dp: json['dp'] as String?,
      points: (json['points'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderboardEntryToJson(_LeaderboardEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'dp': instance.dp,
      'points': instance.points,
      'rank': instance.rank,
    };

_LeaderboardModel _$LeaderboardModelFromJson(Map<String, dynamic> json) =>
    _LeaderboardModel(
      currentUserRank: (json['current_user_rank'] as num).toInt(),
      currentUserPoints: (json['current_user_points'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaderboardModelToJson(_LeaderboardModel instance) =>
    <String, dynamic>{
      'current_user_rank': instance.currentUserRank,
      'current_user_points': instance.currentUserPoints,
      'data': instance.data,
    };
