// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileLikeModel {

 String? get message;@JsonKey(name: 'profile_liked') bool? get profileLiked;
/// Create a copy of ProfileLikeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileLikeModelCopyWith<ProfileLikeModel> get copyWith => _$ProfileLikeModelCopyWithImpl<ProfileLikeModel>(this as ProfileLikeModel, _$identity);

  /// Serializes this ProfileLikeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLikeModel&&(identical(other.message, message) || other.message == message)&&(identical(other.profileLiked, profileLiked) || other.profileLiked == profileLiked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,profileLiked);

@override
String toString() {
  return 'ProfileLikeModel(message: $message, profileLiked: $profileLiked)';
}


}

/// @nodoc
abstract mixin class $ProfileLikeModelCopyWith<$Res>  {
  factory $ProfileLikeModelCopyWith(ProfileLikeModel value, $Res Function(ProfileLikeModel) _then) = _$ProfileLikeModelCopyWithImpl;
@useResult
$Res call({
 String? message,@JsonKey(name: 'profile_liked') bool? profileLiked
});




}
/// @nodoc
class _$ProfileLikeModelCopyWithImpl<$Res>
    implements $ProfileLikeModelCopyWith<$Res> {
  _$ProfileLikeModelCopyWithImpl(this._self, this._then);

  final ProfileLikeModel _self;
  final $Res Function(ProfileLikeModel) _then;

/// Create a copy of ProfileLikeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? profileLiked = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,profileLiked: freezed == profileLiked ? _self.profileLiked : profileLiked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileLikeModel].
extension ProfileLikeModelPatterns on ProfileLikeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileLikeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileLikeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileLikeModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileLikeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileLikeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileLikeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message, @JsonKey(name: 'profile_liked')  bool? profileLiked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileLikeModel() when $default != null:
return $default(_that.message,_that.profileLiked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message, @JsonKey(name: 'profile_liked')  bool? profileLiked)  $default,) {final _that = this;
switch (_that) {
case _ProfileLikeModel():
return $default(_that.message,_that.profileLiked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message, @JsonKey(name: 'profile_liked')  bool? profileLiked)?  $default,) {final _that = this;
switch (_that) {
case _ProfileLikeModel() when $default != null:
return $default(_that.message,_that.profileLiked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileLikeModel implements ProfileLikeModel {
   _ProfileLikeModel({this.message, @JsonKey(name: 'profile_liked') this.profileLiked});
  factory _ProfileLikeModel.fromJson(Map<String, dynamic> json) => _$ProfileLikeModelFromJson(json);

@override final  String? message;
@override@JsonKey(name: 'profile_liked') final  bool? profileLiked;

/// Create a copy of ProfileLikeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileLikeModelCopyWith<_ProfileLikeModel> get copyWith => __$ProfileLikeModelCopyWithImpl<_ProfileLikeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileLikeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLikeModel&&(identical(other.message, message) || other.message == message)&&(identical(other.profileLiked, profileLiked) || other.profileLiked == profileLiked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,profileLiked);

@override
String toString() {
  return 'ProfileLikeModel(message: $message, profileLiked: $profileLiked)';
}


}

/// @nodoc
abstract mixin class _$ProfileLikeModelCopyWith<$Res> implements $ProfileLikeModelCopyWith<$Res> {
  factory _$ProfileLikeModelCopyWith(_ProfileLikeModel value, $Res Function(_ProfileLikeModel) _then) = __$ProfileLikeModelCopyWithImpl;
@override @useResult
$Res call({
 String? message,@JsonKey(name: 'profile_liked') bool? profileLiked
});




}
/// @nodoc
class __$ProfileLikeModelCopyWithImpl<$Res>
    implements _$ProfileLikeModelCopyWith<$Res> {
  __$ProfileLikeModelCopyWithImpl(this._self, this._then);

  final _ProfileLikeModel _self;
  final $Res Function(_ProfileLikeModel) _then;

/// Create a copy of ProfileLikeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? profileLiked = freezed,}) {
  return _then(_ProfileLikeModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,profileLiked: freezed == profileLiked ? _self.profileLiked : profileLiked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
