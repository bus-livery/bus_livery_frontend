// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livery_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveryReqModel {

@JsonKey(name: 'bus_type') String? get busType;@JsonKey(name: 'bus_model') String? get busModel;@JsonKey(name: 'post_name') String? get postName; String? get description;@JsonKey(name: 'post_image_original') String? get postImageOriginal;@JsonKey(name: 'post_image_1080') String? get postImage1080;@JsonKey(name: 'post_image_600') String? get postImage600;@JsonKey(name: 'post_image_200') String? get postImage200;
/// Create a copy of LiveryReqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveryReqModelCopyWith<LiveryReqModel> get copyWith => _$LiveryReqModelCopyWithImpl<LiveryReqModel>(this as LiveryReqModel, _$identity);

  /// Serializes this LiveryReqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveryReqModel&&(identical(other.busType, busType) || other.busType == busType)&&(identical(other.busModel, busModel) || other.busModel == busModel)&&(identical(other.postName, postName) || other.postName == postName)&&(identical(other.description, description) || other.description == description)&&(identical(other.postImageOriginal, postImageOriginal) || other.postImageOriginal == postImageOriginal)&&(identical(other.postImage1080, postImage1080) || other.postImage1080 == postImage1080)&&(identical(other.postImage600, postImage600) || other.postImage600 == postImage600)&&(identical(other.postImage200, postImage200) || other.postImage200 == postImage200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,busType,busModel,postName,description,postImageOriginal,postImage1080,postImage600,postImage200);

@override
String toString() {
  return 'LiveryReqModel(busType: $busType, busModel: $busModel, postName: $postName, description: $description, postImageOriginal: $postImageOriginal, postImage1080: $postImage1080, postImage600: $postImage600, postImage200: $postImage200)';
}


}

/// @nodoc
abstract mixin class $LiveryReqModelCopyWith<$Res>  {
  factory $LiveryReqModelCopyWith(LiveryReqModel value, $Res Function(LiveryReqModel) _then) = _$LiveryReqModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'bus_type') String? busType,@JsonKey(name: 'bus_model') String? busModel,@JsonKey(name: 'post_name') String? postName, String? description,@JsonKey(name: 'post_image_original') String? postImageOriginal,@JsonKey(name: 'post_image_1080') String? postImage1080,@JsonKey(name: 'post_image_600') String? postImage600,@JsonKey(name: 'post_image_200') String? postImage200
});




}
/// @nodoc
class _$LiveryReqModelCopyWithImpl<$Res>
    implements $LiveryReqModelCopyWith<$Res> {
  _$LiveryReqModelCopyWithImpl(this._self, this._then);

  final LiveryReqModel _self;
  final $Res Function(LiveryReqModel) _then;

/// Create a copy of LiveryReqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? busType = freezed,Object? busModel = freezed,Object? postName = freezed,Object? description = freezed,Object? postImageOriginal = freezed,Object? postImage1080 = freezed,Object? postImage600 = freezed,Object? postImage200 = freezed,}) {
  return _then(_self.copyWith(
busType: freezed == busType ? _self.busType : busType // ignore: cast_nullable_to_non_nullable
as String?,busModel: freezed == busModel ? _self.busModel : busModel // ignore: cast_nullable_to_non_nullable
as String?,postName: freezed == postName ? _self.postName : postName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,postImageOriginal: freezed == postImageOriginal ? _self.postImageOriginal : postImageOriginal // ignore: cast_nullable_to_non_nullable
as String?,postImage1080: freezed == postImage1080 ? _self.postImage1080 : postImage1080 // ignore: cast_nullable_to_non_nullable
as String?,postImage600: freezed == postImage600 ? _self.postImage600 : postImage600 // ignore: cast_nullable_to_non_nullable
as String?,postImage200: freezed == postImage200 ? _self.postImage200 : postImage200 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveryReqModel].
extension LiveryReqModelPatterns on LiveryReqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveryReqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveryReqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveryReqModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveryReqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveryReqModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveryReqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_model')  String? busModel, @JsonKey(name: 'post_name')  String? postName,  String? description, @JsonKey(name: 'post_image_original')  String? postImageOriginal, @JsonKey(name: 'post_image_1080')  String? postImage1080, @JsonKey(name: 'post_image_600')  String? postImage600, @JsonKey(name: 'post_image_200')  String? postImage200)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveryReqModel() when $default != null:
return $default(_that.busType,_that.busModel,_that.postName,_that.description,_that.postImageOriginal,_that.postImage1080,_that.postImage600,_that.postImage200);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_model')  String? busModel, @JsonKey(name: 'post_name')  String? postName,  String? description, @JsonKey(name: 'post_image_original')  String? postImageOriginal, @JsonKey(name: 'post_image_1080')  String? postImage1080, @JsonKey(name: 'post_image_600')  String? postImage600, @JsonKey(name: 'post_image_200')  String? postImage200)  $default,) {final _that = this;
switch (_that) {
case _LiveryReqModel():
return $default(_that.busType,_that.busModel,_that.postName,_that.description,_that.postImageOriginal,_that.postImage1080,_that.postImage600,_that.postImage200);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_model')  String? busModel, @JsonKey(name: 'post_name')  String? postName,  String? description, @JsonKey(name: 'post_image_original')  String? postImageOriginal, @JsonKey(name: 'post_image_1080')  String? postImage1080, @JsonKey(name: 'post_image_600')  String? postImage600, @JsonKey(name: 'post_image_200')  String? postImage200)?  $default,) {final _that = this;
switch (_that) {
case _LiveryReqModel() when $default != null:
return $default(_that.busType,_that.busModel,_that.postName,_that.description,_that.postImageOriginal,_that.postImage1080,_that.postImage600,_that.postImage200);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveryReqModel implements LiveryReqModel {
   _LiveryReqModel({@JsonKey(name: 'bus_type') this.busType, @JsonKey(name: 'bus_model') this.busModel, @JsonKey(name: 'post_name') this.postName, this.description, @JsonKey(name: 'post_image_original') this.postImageOriginal, @JsonKey(name: 'post_image_1080') this.postImage1080, @JsonKey(name: 'post_image_600') this.postImage600, @JsonKey(name: 'post_image_200') this.postImage200});
  factory _LiveryReqModel.fromJson(Map<String, dynamic> json) => _$LiveryReqModelFromJson(json);

@override@JsonKey(name: 'bus_type') final  String? busType;
@override@JsonKey(name: 'bus_model') final  String? busModel;
@override@JsonKey(name: 'post_name') final  String? postName;
@override final  String? description;
@override@JsonKey(name: 'post_image_original') final  String? postImageOriginal;
@override@JsonKey(name: 'post_image_1080') final  String? postImage1080;
@override@JsonKey(name: 'post_image_600') final  String? postImage600;
@override@JsonKey(name: 'post_image_200') final  String? postImage200;

/// Create a copy of LiveryReqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveryReqModelCopyWith<_LiveryReqModel> get copyWith => __$LiveryReqModelCopyWithImpl<_LiveryReqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveryReqModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveryReqModel&&(identical(other.busType, busType) || other.busType == busType)&&(identical(other.busModel, busModel) || other.busModel == busModel)&&(identical(other.postName, postName) || other.postName == postName)&&(identical(other.description, description) || other.description == description)&&(identical(other.postImageOriginal, postImageOriginal) || other.postImageOriginal == postImageOriginal)&&(identical(other.postImage1080, postImage1080) || other.postImage1080 == postImage1080)&&(identical(other.postImage600, postImage600) || other.postImage600 == postImage600)&&(identical(other.postImage200, postImage200) || other.postImage200 == postImage200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,busType,busModel,postName,description,postImageOriginal,postImage1080,postImage600,postImage200);

@override
String toString() {
  return 'LiveryReqModel(busType: $busType, busModel: $busModel, postName: $postName, description: $description, postImageOriginal: $postImageOriginal, postImage1080: $postImage1080, postImage600: $postImage600, postImage200: $postImage200)';
}


}

/// @nodoc
abstract mixin class _$LiveryReqModelCopyWith<$Res> implements $LiveryReqModelCopyWith<$Res> {
  factory _$LiveryReqModelCopyWith(_LiveryReqModel value, $Res Function(_LiveryReqModel) _then) = __$LiveryReqModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'bus_type') String? busType,@JsonKey(name: 'bus_model') String? busModel,@JsonKey(name: 'post_name') String? postName, String? description,@JsonKey(name: 'post_image_original') String? postImageOriginal,@JsonKey(name: 'post_image_1080') String? postImage1080,@JsonKey(name: 'post_image_600') String? postImage600,@JsonKey(name: 'post_image_200') String? postImage200
});




}
/// @nodoc
class __$LiveryReqModelCopyWithImpl<$Res>
    implements _$LiveryReqModelCopyWith<$Res> {
  __$LiveryReqModelCopyWithImpl(this._self, this._then);

  final _LiveryReqModel _self;
  final $Res Function(_LiveryReqModel) _then;

/// Create a copy of LiveryReqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? busType = freezed,Object? busModel = freezed,Object? postName = freezed,Object? description = freezed,Object? postImageOriginal = freezed,Object? postImage1080 = freezed,Object? postImage600 = freezed,Object? postImage200 = freezed,}) {
  return _then(_LiveryReqModel(
busType: freezed == busType ? _self.busType : busType // ignore: cast_nullable_to_non_nullable
as String?,busModel: freezed == busModel ? _self.busModel : busModel // ignore: cast_nullable_to_non_nullable
as String?,postName: freezed == postName ? _self.postName : postName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,postImageOriginal: freezed == postImageOriginal ? _self.postImageOriginal : postImageOriginal // ignore: cast_nullable_to_non_nullable
as String?,postImage1080: freezed == postImage1080 ? _self.postImage1080 : postImage1080 // ignore: cast_nullable_to_non_nullable
as String?,postImage600: freezed == postImage600 ? _self.postImage600 : postImage600 // ignore: cast_nullable_to_non_nullable
as String?,postImage200: freezed == postImage200 ? _self.postImage200 : postImage200 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
