// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_limit_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdLimitStatusModel {

 int get limit;@JsonKey(name: 'points_earned_today') int get pointsEarnedToday;@JsonKey(name: 'reached_limit') bool get reachedLimit;
/// Create a copy of AdLimitStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdLimitStatusModelCopyWith<AdLimitStatusModel> get copyWith => _$AdLimitStatusModelCopyWithImpl<AdLimitStatusModel>(this as AdLimitStatusModel, _$identity);

  /// Serializes this AdLimitStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdLimitStatusModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.pointsEarnedToday, pointsEarnedToday) || other.pointsEarnedToday == pointsEarnedToday)&&(identical(other.reachedLimit, reachedLimit) || other.reachedLimit == reachedLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,pointsEarnedToday,reachedLimit);

@override
String toString() {
  return 'AdLimitStatusModel(limit: $limit, pointsEarnedToday: $pointsEarnedToday, reachedLimit: $reachedLimit)';
}


}

/// @nodoc
abstract mixin class $AdLimitStatusModelCopyWith<$Res>  {
  factory $AdLimitStatusModelCopyWith(AdLimitStatusModel value, $Res Function(AdLimitStatusModel) _then) = _$AdLimitStatusModelCopyWithImpl;
@useResult
$Res call({
 int limit,@JsonKey(name: 'points_earned_today') int pointsEarnedToday,@JsonKey(name: 'reached_limit') bool reachedLimit
});




}
/// @nodoc
class _$AdLimitStatusModelCopyWithImpl<$Res>
    implements $AdLimitStatusModelCopyWith<$Res> {
  _$AdLimitStatusModelCopyWithImpl(this._self, this._then);

  final AdLimitStatusModel _self;
  final $Res Function(AdLimitStatusModel) _then;

/// Create a copy of AdLimitStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? pointsEarnedToday = null,Object? reachedLimit = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,pointsEarnedToday: null == pointsEarnedToday ? _self.pointsEarnedToday : pointsEarnedToday // ignore: cast_nullable_to_non_nullable
as int,reachedLimit: null == reachedLimit ? _self.reachedLimit : reachedLimit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdLimitStatusModel].
extension AdLimitStatusModelPatterns on AdLimitStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdLimitStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdLimitStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdLimitStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _AdLimitStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdLimitStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdLimitStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit, @JsonKey(name: 'points_earned_today')  int pointsEarnedToday, @JsonKey(name: 'reached_limit')  bool reachedLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdLimitStatusModel() when $default != null:
return $default(_that.limit,_that.pointsEarnedToday,_that.reachedLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit, @JsonKey(name: 'points_earned_today')  int pointsEarnedToday, @JsonKey(name: 'reached_limit')  bool reachedLimit)  $default,) {final _that = this;
switch (_that) {
case _AdLimitStatusModel():
return $default(_that.limit,_that.pointsEarnedToday,_that.reachedLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit, @JsonKey(name: 'points_earned_today')  int pointsEarnedToday, @JsonKey(name: 'reached_limit')  bool reachedLimit)?  $default,) {final _that = this;
switch (_that) {
case _AdLimitStatusModel() when $default != null:
return $default(_that.limit,_that.pointsEarnedToday,_that.reachedLimit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdLimitStatusModel implements AdLimitStatusModel {
   _AdLimitStatusModel({required this.limit, @JsonKey(name: 'points_earned_today') required this.pointsEarnedToday, @JsonKey(name: 'reached_limit') required this.reachedLimit});
  factory _AdLimitStatusModel.fromJson(Map<String, dynamic> json) => _$AdLimitStatusModelFromJson(json);

@override final  int limit;
@override@JsonKey(name: 'points_earned_today') final  int pointsEarnedToday;
@override@JsonKey(name: 'reached_limit') final  bool reachedLimit;

/// Create a copy of AdLimitStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdLimitStatusModelCopyWith<_AdLimitStatusModel> get copyWith => __$AdLimitStatusModelCopyWithImpl<_AdLimitStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdLimitStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdLimitStatusModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.pointsEarnedToday, pointsEarnedToday) || other.pointsEarnedToday == pointsEarnedToday)&&(identical(other.reachedLimit, reachedLimit) || other.reachedLimit == reachedLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,pointsEarnedToday,reachedLimit);

@override
String toString() {
  return 'AdLimitStatusModel(limit: $limit, pointsEarnedToday: $pointsEarnedToday, reachedLimit: $reachedLimit)';
}


}

/// @nodoc
abstract mixin class _$AdLimitStatusModelCopyWith<$Res> implements $AdLimitStatusModelCopyWith<$Res> {
  factory _$AdLimitStatusModelCopyWith(_AdLimitStatusModel value, $Res Function(_AdLimitStatusModel) _then) = __$AdLimitStatusModelCopyWithImpl;
@override @useResult
$Res call({
 int limit,@JsonKey(name: 'points_earned_today') int pointsEarnedToday,@JsonKey(name: 'reached_limit') bool reachedLimit
});




}
/// @nodoc
class __$AdLimitStatusModelCopyWithImpl<$Res>
    implements _$AdLimitStatusModelCopyWith<$Res> {
  __$AdLimitStatusModelCopyWithImpl(this._self, this._then);

  final _AdLimitStatusModel _self;
  final $Res Function(_AdLimitStatusModel) _then;

/// Create a copy of AdLimitStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? pointsEarnedToday = null,Object? reachedLimit = null,}) {
  return _then(_AdLimitStatusModel(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,pointsEarnedToday: null == pointsEarnedToday ? _self.pointsEarnedToday : pointsEarnedToday // ignore: cast_nullable_to_non_nullable
as int,reachedLimit: null == reachedLimit ? _self.reachedLimit : reachedLimit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
