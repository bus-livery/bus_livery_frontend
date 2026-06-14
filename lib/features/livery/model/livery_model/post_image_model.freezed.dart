// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveryImageModel {

@JsonKey(name: 'ID') int? get id;@JsonKey(name: 'CreatedAt') DateTime? get createdAt;@JsonKey(name: 'UpdatedAt') DateTime? get updatedAt;@JsonKey(name: 'DeletedAt') dynamic get deletedAt;@JsonKey(name: 'livery_image_original') String? get liveryImageOriginal;@JsonKey(name: 'livery_image_1080') String? get liveryImage1080;@JsonKey(name: 'livery_image_600') String? get livertImage600;@JsonKey(name: 'livery_image_200') String? get liveryImage200;
/// Create a copy of LiveryImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveryImageModelCopyWith<LiveryImageModel> get copyWith => _$LiveryImageModelCopyWithImpl<LiveryImageModel>(this as LiveryImageModel, _$identity);

  /// Serializes this LiveryImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveryImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.liveryImageOriginal, liveryImageOriginal) || other.liveryImageOriginal == liveryImageOriginal)&&(identical(other.liveryImage1080, liveryImage1080) || other.liveryImage1080 == liveryImage1080)&&(identical(other.livertImage600, livertImage600) || other.livertImage600 == livertImage600)&&(identical(other.liveryImage200, liveryImage200) || other.liveryImage200 == liveryImage200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),liveryImageOriginal,liveryImage1080,livertImage600,liveryImage200);

@override
String toString() {
  return 'LiveryImageModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, liveryImageOriginal: $liveryImageOriginal, liveryImage1080: $liveryImage1080, livertImage600: $livertImage600, liveryImage200: $liveryImage200)';
}


}

/// @nodoc
abstract mixin class $LiveryImageModelCopyWith<$Res>  {
  factory $LiveryImageModelCopyWith(LiveryImageModel value, $Res Function(LiveryImageModel) _then) = _$LiveryImageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt,@JsonKey(name: 'livery_image_original') String? liveryImageOriginal,@JsonKey(name: 'livery_image_1080') String? liveryImage1080,@JsonKey(name: 'livery_image_600') String? livertImage600,@JsonKey(name: 'livery_image_200') String? liveryImage200
});




}
/// @nodoc
class _$LiveryImageModelCopyWithImpl<$Res>
    implements $LiveryImageModelCopyWith<$Res> {
  _$LiveryImageModelCopyWithImpl(this._self, this._then);

  final LiveryImageModel _self;
  final $Res Function(LiveryImageModel) _then;

/// Create a copy of LiveryImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? liveryImageOriginal = freezed,Object? liveryImage1080 = freezed,Object? livertImage600 = freezed,Object? liveryImage200 = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,liveryImageOriginal: freezed == liveryImageOriginal ? _self.liveryImageOriginal : liveryImageOriginal // ignore: cast_nullable_to_non_nullable
as String?,liveryImage1080: freezed == liveryImage1080 ? _self.liveryImage1080 : liveryImage1080 // ignore: cast_nullable_to_non_nullable
as String?,livertImage600: freezed == livertImage600 ? _self.livertImage600 : livertImage600 // ignore: cast_nullable_to_non_nullable
as String?,liveryImage200: freezed == liveryImage200 ? _self.liveryImage200 : liveryImage200 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveryImageModel].
extension LiveryImageModelPatterns on LiveryImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveryImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveryImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveryImageModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveryImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveryImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveryImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'livery_image_original')  String? liveryImageOriginal, @JsonKey(name: 'livery_image_1080')  String? liveryImage1080, @JsonKey(name: 'livery_image_600')  String? livertImage600, @JsonKey(name: 'livery_image_200')  String? liveryImage200)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveryImageModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.liveryImageOriginal,_that.liveryImage1080,_that.livertImage600,_that.liveryImage200);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'livery_image_original')  String? liveryImageOriginal, @JsonKey(name: 'livery_image_1080')  String? liveryImage1080, @JsonKey(name: 'livery_image_600')  String? livertImage600, @JsonKey(name: 'livery_image_200')  String? liveryImage200)  $default,) {final _that = this;
switch (_that) {
case _LiveryImageModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.liveryImageOriginal,_that.liveryImage1080,_that.livertImage600,_that.liveryImage200);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'livery_image_original')  String? liveryImageOriginal, @JsonKey(name: 'livery_image_1080')  String? liveryImage1080, @JsonKey(name: 'livery_image_600')  String? livertImage600, @JsonKey(name: 'livery_image_200')  String? liveryImage200)?  $default,) {final _that = this;
switch (_that) {
case _LiveryImageModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.liveryImageOriginal,_that.liveryImage1080,_that.livertImage600,_that.liveryImage200);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveryImageModel implements LiveryImageModel {
   _LiveryImageModel({@JsonKey(name: 'ID') this.id, @JsonKey(name: 'CreatedAt') this.createdAt, @JsonKey(name: 'UpdatedAt') this.updatedAt, @JsonKey(name: 'DeletedAt') this.deletedAt, @JsonKey(name: 'livery_image_original') this.liveryImageOriginal, @JsonKey(name: 'livery_image_1080') this.liveryImage1080, @JsonKey(name: 'livery_image_600') this.livertImage600, @JsonKey(name: 'livery_image_200') this.liveryImage200});
  factory _LiveryImageModel.fromJson(Map<String, dynamic> json) => _$LiveryImageModelFromJson(json);

@override@JsonKey(name: 'ID') final  int? id;
@override@JsonKey(name: 'CreatedAt') final  DateTime? createdAt;
@override@JsonKey(name: 'UpdatedAt') final  DateTime? updatedAt;
@override@JsonKey(name: 'DeletedAt') final  dynamic deletedAt;
@override@JsonKey(name: 'livery_image_original') final  String? liveryImageOriginal;
@override@JsonKey(name: 'livery_image_1080') final  String? liveryImage1080;
@override@JsonKey(name: 'livery_image_600') final  String? livertImage600;
@override@JsonKey(name: 'livery_image_200') final  String? liveryImage200;

/// Create a copy of LiveryImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveryImageModelCopyWith<_LiveryImageModel> get copyWith => __$LiveryImageModelCopyWithImpl<_LiveryImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveryImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveryImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.liveryImageOriginal, liveryImageOriginal) || other.liveryImageOriginal == liveryImageOriginal)&&(identical(other.liveryImage1080, liveryImage1080) || other.liveryImage1080 == liveryImage1080)&&(identical(other.livertImage600, livertImage600) || other.livertImage600 == livertImage600)&&(identical(other.liveryImage200, liveryImage200) || other.liveryImage200 == liveryImage200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),liveryImageOriginal,liveryImage1080,livertImage600,liveryImage200);

@override
String toString() {
  return 'LiveryImageModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, liveryImageOriginal: $liveryImageOriginal, liveryImage1080: $liveryImage1080, livertImage600: $livertImage600, liveryImage200: $liveryImage200)';
}


}

/// @nodoc
abstract mixin class _$LiveryImageModelCopyWith<$Res> implements $LiveryImageModelCopyWith<$Res> {
  factory _$LiveryImageModelCopyWith(_LiveryImageModel value, $Res Function(_LiveryImageModel) _then) = __$LiveryImageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt,@JsonKey(name: 'livery_image_original') String? liveryImageOriginal,@JsonKey(name: 'livery_image_1080') String? liveryImage1080,@JsonKey(name: 'livery_image_600') String? livertImage600,@JsonKey(name: 'livery_image_200') String? liveryImage200
});




}
/// @nodoc
class __$LiveryImageModelCopyWithImpl<$Res>
    implements _$LiveryImageModelCopyWith<$Res> {
  __$LiveryImageModelCopyWithImpl(this._self, this._then);

  final _LiveryImageModel _self;
  final $Res Function(_LiveryImageModel) _then;

/// Create a copy of LiveryImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? liveryImageOriginal = freezed,Object? liveryImage1080 = freezed,Object? livertImage600 = freezed,Object? liveryImage200 = freezed,}) {
  return _then(_LiveryImageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,liveryImageOriginal: freezed == liveryImageOriginal ? _self.liveryImageOriginal : liveryImageOriginal // ignore: cast_nullable_to_non_nullable
as String?,liveryImage1080: freezed == liveryImage1080 ? _self.liveryImage1080 : liveryImage1080 // ignore: cast_nullable_to_non_nullable
as String?,livertImage600: freezed == livertImage600 ? _self.livertImage600 : livertImage600 // ignore: cast_nullable_to_non_nullable
as String?,liveryImage200: freezed == liveryImage200 ? _self.liveryImage200 : liveryImage200 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
