// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardEntry {

 int get id; String get username; String? get dp; int get points; int get rank;
/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith => _$LeaderboardEntryCopyWithImpl<LeaderboardEntry>(this as LeaderboardEntry, _$identity);

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.dp, dp) || other.dp == dp)&&(identical(other.points, points) || other.points == points)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,dp,points,rank);

@override
String toString() {
  return 'LeaderboardEntry(id: $id, username: $username, dp: $dp, points: $points, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $LeaderboardEntryCopyWith<$Res>  {
  factory $LeaderboardEntryCopyWith(LeaderboardEntry value, $Res Function(LeaderboardEntry) _then) = _$LeaderboardEntryCopyWithImpl;
@useResult
$Res call({
 int id, String username, String? dp, int points, int rank
});




}
/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final LeaderboardEntry _self;
  final $Res Function(LeaderboardEntry) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? dp = freezed,Object? points = null,Object? rank = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,dp: freezed == dp ? _self.dp : dp // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardEntry].
extension LeaderboardEntryPatterns on LeaderboardEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardEntry value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String? dp,  int points,  int rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
return $default(_that.id,_that.username,_that.dp,_that.points,_that.rank);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String? dp,  int points,  int rank)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardEntry():
return $default(_that.id,_that.username,_that.dp,_that.points,_that.rank);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String? dp,  int points,  int rank)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
return $default(_that.id,_that.username,_that.dp,_that.points,_that.rank);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderboardEntry implements LeaderboardEntry {
   _LeaderboardEntry({required this.id, required this.username, this.dp, required this.points, required this.rank});
  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) => _$LeaderboardEntryFromJson(json);

@override final  int id;
@override final  String username;
@override final  String? dp;
@override final  int points;
@override final  int rank;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardEntryCopyWith<_LeaderboardEntry> get copyWith => __$LeaderboardEntryCopyWithImpl<_LeaderboardEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.dp, dp) || other.dp == dp)&&(identical(other.points, points) || other.points == points)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,dp,points,rank);

@override
String toString() {
  return 'LeaderboardEntry(id: $id, username: $username, dp: $dp, points: $points, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardEntryCopyWith<$Res> implements $LeaderboardEntryCopyWith<$Res> {
  factory _$LeaderboardEntryCopyWith(_LeaderboardEntry value, $Res Function(_LeaderboardEntry) _then) = __$LeaderboardEntryCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String? dp, int points, int rank
});




}
/// @nodoc
class __$LeaderboardEntryCopyWithImpl<$Res>
    implements _$LeaderboardEntryCopyWith<$Res> {
  __$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final _LeaderboardEntry _self;
  final $Res Function(_LeaderboardEntry) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? dp = freezed,Object? points = null,Object? rank = null,}) {
  return _then(_LeaderboardEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,dp: freezed == dp ? _self.dp : dp // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LeaderboardModel {

@JsonKey(name: 'current_user_rank') int get currentUserRank;@JsonKey(name: 'current_user_points') int get currentUserPoints; List<LeaderboardEntry> get data;
/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardModelCopyWith<LeaderboardModel> get copyWith => _$LeaderboardModelCopyWithImpl<LeaderboardModel>(this as LeaderboardModel, _$identity);

  /// Serializes this LeaderboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardModel&&(identical(other.currentUserRank, currentUserRank) || other.currentUserRank == currentUserRank)&&(identical(other.currentUserPoints, currentUserPoints) || other.currentUserPoints == currentUserPoints)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentUserRank,currentUserPoints,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'LeaderboardModel(currentUserRank: $currentUserRank, currentUserPoints: $currentUserPoints, data: $data)';
}


}

/// @nodoc
abstract mixin class $LeaderboardModelCopyWith<$Res>  {
  factory $LeaderboardModelCopyWith(LeaderboardModel value, $Res Function(LeaderboardModel) _then) = _$LeaderboardModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_user_rank') int currentUserRank,@JsonKey(name: 'current_user_points') int currentUserPoints, List<LeaderboardEntry> data
});




}
/// @nodoc
class _$LeaderboardModelCopyWithImpl<$Res>
    implements $LeaderboardModelCopyWith<$Res> {
  _$LeaderboardModelCopyWithImpl(this._self, this._then);

  final LeaderboardModel _self;
  final $Res Function(LeaderboardModel) _then;

/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentUserRank = null,Object? currentUserPoints = null,Object? data = null,}) {
  return _then(_self.copyWith(
currentUserRank: null == currentUserRank ? _self.currentUserRank : currentUserRank // ignore: cast_nullable_to_non_nullable
as int,currentUserPoints: null == currentUserPoints ? _self.currentUserPoints : currentUserPoints // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardModel].
extension LeaderboardModelPatterns on LeaderboardModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_user_rank')  int currentUserRank, @JsonKey(name: 'current_user_points')  int currentUserPoints,  List<LeaderboardEntry> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
return $default(_that.currentUserRank,_that.currentUserPoints,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_user_rank')  int currentUserRank, @JsonKey(name: 'current_user_points')  int currentUserPoints,  List<LeaderboardEntry> data)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardModel():
return $default(_that.currentUserRank,_that.currentUserPoints,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_user_rank')  int currentUserRank, @JsonKey(name: 'current_user_points')  int currentUserPoints,  List<LeaderboardEntry> data)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
return $default(_that.currentUserRank,_that.currentUserPoints,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderboardModel implements LeaderboardModel {
   _LeaderboardModel({@JsonKey(name: 'current_user_rank') required this.currentUserRank, @JsonKey(name: 'current_user_points') required this.currentUserPoints, required final  List<LeaderboardEntry> data}): _data = data;
  factory _LeaderboardModel.fromJson(Map<String, dynamic> json) => _$LeaderboardModelFromJson(json);

@override@JsonKey(name: 'current_user_rank') final  int currentUserRank;
@override@JsonKey(name: 'current_user_points') final  int currentUserPoints;
 final  List<LeaderboardEntry> _data;
@override List<LeaderboardEntry> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardModelCopyWith<_LeaderboardModel> get copyWith => __$LeaderboardModelCopyWithImpl<_LeaderboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardModel&&(identical(other.currentUserRank, currentUserRank) || other.currentUserRank == currentUserRank)&&(identical(other.currentUserPoints, currentUserPoints) || other.currentUserPoints == currentUserPoints)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentUserRank,currentUserPoints,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LeaderboardModel(currentUserRank: $currentUserRank, currentUserPoints: $currentUserPoints, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardModelCopyWith<$Res> implements $LeaderboardModelCopyWith<$Res> {
  factory _$LeaderboardModelCopyWith(_LeaderboardModel value, $Res Function(_LeaderboardModel) _then) = __$LeaderboardModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_user_rank') int currentUserRank,@JsonKey(name: 'current_user_points') int currentUserPoints, List<LeaderboardEntry> data
});




}
/// @nodoc
class __$LeaderboardModelCopyWithImpl<$Res>
    implements _$LeaderboardModelCopyWith<$Res> {
  __$LeaderboardModelCopyWithImpl(this._self, this._then);

  final _LeaderboardModel _self;
  final $Res Function(_LeaderboardModel) _then;

/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentUserRank = null,Object? currentUserPoints = null,Object? data = null,}) {
  return _then(_LeaderboardModel(
currentUserRank: null == currentUserRank ? _self.currentUserRank : currentUserRank // ignore: cast_nullable_to_non_nullable
as int,currentUserPoints: null == currentUserPoints ? _self.currentUserPoints : currentUserPoints // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,
  ));
}


}

// dart format on
