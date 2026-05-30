// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadCountModel {

 String? get message;@JsonKey(name: 'livery_id') String? get liveryId;@JsonKey(name: 'download_count') int? get downloadCount;
/// Create a copy of DownloadCountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadCountModelCopyWith<DownloadCountModel> get copyWith => _$DownloadCountModelCopyWithImpl<DownloadCountModel>(this as DownloadCountModel, _$identity);

  /// Serializes this DownloadCountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadCountModel&&(identical(other.message, message) || other.message == message)&&(identical(other.liveryId, liveryId) || other.liveryId == liveryId)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,liveryId,downloadCount);

@override
String toString() {
  return 'DownloadCountModel(message: $message, liveryId: $liveryId, downloadCount: $downloadCount)';
}


}

/// @nodoc
abstract mixin class $DownloadCountModelCopyWith<$Res>  {
  factory $DownloadCountModelCopyWith(DownloadCountModel value, $Res Function(DownloadCountModel) _then) = _$DownloadCountModelCopyWithImpl;
@useResult
$Res call({
 String? message,@JsonKey(name: 'livery_id') String? liveryId,@JsonKey(name: 'download_count') int? downloadCount
});




}
/// @nodoc
class _$DownloadCountModelCopyWithImpl<$Res>
    implements $DownloadCountModelCopyWith<$Res> {
  _$DownloadCountModelCopyWithImpl(this._self, this._then);

  final DownloadCountModel _self;
  final $Res Function(DownloadCountModel) _then;

/// Create a copy of DownloadCountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? liveryId = freezed,Object? downloadCount = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,liveryId: freezed == liveryId ? _self.liveryId : liveryId // ignore: cast_nullable_to_non_nullable
as String?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadCountModel].
extension DownloadCountModelPatterns on DownloadCountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadCountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadCountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadCountModel value)  $default,){
final _that = this;
switch (_that) {
case _DownloadCountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadCountModel value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadCountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message, @JsonKey(name: 'livery_id')  String? liveryId, @JsonKey(name: 'download_count')  int? downloadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadCountModel() when $default != null:
return $default(_that.message,_that.liveryId,_that.downloadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message, @JsonKey(name: 'livery_id')  String? liveryId, @JsonKey(name: 'download_count')  int? downloadCount)  $default,) {final _that = this;
switch (_that) {
case _DownloadCountModel():
return $default(_that.message,_that.liveryId,_that.downloadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message, @JsonKey(name: 'livery_id')  String? liveryId, @JsonKey(name: 'download_count')  int? downloadCount)?  $default,) {final _that = this;
switch (_that) {
case _DownloadCountModel() when $default != null:
return $default(_that.message,_that.liveryId,_that.downloadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadCountModel implements DownloadCountModel {
   _DownloadCountModel({this.message, @JsonKey(name: 'livery_id') this.liveryId, @JsonKey(name: 'download_count') this.downloadCount});
  factory _DownloadCountModel.fromJson(Map<String, dynamic> json) => _$DownloadCountModelFromJson(json);

@override final  String? message;
@override@JsonKey(name: 'livery_id') final  String? liveryId;
@override@JsonKey(name: 'download_count') final  int? downloadCount;

/// Create a copy of DownloadCountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadCountModelCopyWith<_DownloadCountModel> get copyWith => __$DownloadCountModelCopyWithImpl<_DownloadCountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadCountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadCountModel&&(identical(other.message, message) || other.message == message)&&(identical(other.liveryId, liveryId) || other.liveryId == liveryId)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,liveryId,downloadCount);

@override
String toString() {
  return 'DownloadCountModel(message: $message, liveryId: $liveryId, downloadCount: $downloadCount)';
}


}

/// @nodoc
abstract mixin class _$DownloadCountModelCopyWith<$Res> implements $DownloadCountModelCopyWith<$Res> {
  factory _$DownloadCountModelCopyWith(_DownloadCountModel value, $Res Function(_DownloadCountModel) _then) = __$DownloadCountModelCopyWithImpl;
@override @useResult
$Res call({
 String? message,@JsonKey(name: 'livery_id') String? liveryId,@JsonKey(name: 'download_count') int? downloadCount
});




}
/// @nodoc
class __$DownloadCountModelCopyWithImpl<$Res>
    implements _$DownloadCountModelCopyWith<$Res> {
  __$DownloadCountModelCopyWithImpl(this._self, this._then);

  final _DownloadCountModel _self;
  final $Res Function(_DownloadCountModel) _then;

/// Create a copy of DownloadCountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? liveryId = freezed,Object? downloadCount = freezed,}) {
  return _then(_DownloadCountModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,liveryId: freezed == liveryId ? _self.liveryId : liveryId // ignore: cast_nullable_to_non_nullable
as String?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
