// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horn_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HornModel {

@JsonKey(name: 'ID') int? get id;@JsonKey(name: 'CreatedAt') DateTime? get createdAt;@JsonKey(name: 'UpdatedAt') DateTime? get updatedAt;@JsonKey(name: 'DeletedAt') dynamic get deletedAt;@JsonKey(name: 'user_id') int? get userId; ProfileModel? get user;@JsonKey(name: 'audio_path') String get audioPath; String get title; String? get description; double? get duration; int? get size;@JsonKey(name: 'approval_status') String? get approvalStatus;
/// Create a copy of HornModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HornModelCopyWith<HornModel> get copyWith => _$HornModelCopyWithImpl<HornModel>(this as HornModel, _$identity);

  /// Serializes this HornModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HornModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),userId,user,audioPath,title,description,duration,size,approvalStatus);

@override
String toString() {
  return 'HornModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, userId: $userId, user: $user, audioPath: $audioPath, title: $title, description: $description, duration: $duration, size: $size, approvalStatus: $approvalStatus)';
}


}

/// @nodoc
abstract mixin class $HornModelCopyWith<$Res>  {
  factory $HornModelCopyWith(HornModel value, $Res Function(HornModel) _then) = _$HornModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt,@JsonKey(name: 'user_id') int? userId, ProfileModel? user,@JsonKey(name: 'audio_path') String audioPath, String title, String? description, double? duration, int? size,@JsonKey(name: 'approval_status') String? approvalStatus
});


$ProfileModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$HornModelCopyWithImpl<$Res>
    implements $HornModelCopyWith<$Res> {
  _$HornModelCopyWithImpl(this._self, this._then);

  final HornModel _self;
  final $Res Function(HornModel) _then;

/// Create a copy of HornModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? userId = freezed,Object? user = freezed,Object? audioPath = null,Object? title = null,Object? description = freezed,Object? duration = freezed,Object? size = freezed,Object? approvalStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,audioPath: null == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HornModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [HornModel].
extension HornModelPatterns on HornModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HornModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HornModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HornModel value)  $default,){
final _that = this;
switch (_that) {
case _HornModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HornModel value)?  $default,){
final _that = this;
switch (_that) {
case _HornModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'user_id')  int? userId,  ProfileModel? user, @JsonKey(name: 'audio_path')  String audioPath,  String title,  String? description,  double? duration,  int? size, @JsonKey(name: 'approval_status')  String? approvalStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HornModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.userId,_that.user,_that.audioPath,_that.title,_that.description,_that.duration,_that.size,_that.approvalStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'user_id')  int? userId,  ProfileModel? user, @JsonKey(name: 'audio_path')  String audioPath,  String title,  String? description,  double? duration,  int? size, @JsonKey(name: 'approval_status')  String? approvalStatus)  $default,) {final _that = this;
switch (_that) {
case _HornModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.userId,_that.user,_that.audioPath,_that.title,_that.description,_that.duration,_that.size,_that.approvalStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'user_id')  int? userId,  ProfileModel? user, @JsonKey(name: 'audio_path')  String audioPath,  String title,  String? description,  double? duration,  int? size, @JsonKey(name: 'approval_status')  String? approvalStatus)?  $default,) {final _that = this;
switch (_that) {
case _HornModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.userId,_that.user,_that.audioPath,_that.title,_that.description,_that.duration,_that.size,_that.approvalStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HornModel implements HornModel {
   _HornModel({@JsonKey(name: 'ID') this.id, @JsonKey(name: 'CreatedAt') this.createdAt, @JsonKey(name: 'UpdatedAt') this.updatedAt, @JsonKey(name: 'DeletedAt') this.deletedAt, @JsonKey(name: 'user_id') this.userId, this.user, @JsonKey(name: 'audio_path') required this.audioPath, required this.title, this.description, this.duration, this.size, @JsonKey(name: 'approval_status') this.approvalStatus});
  factory _HornModel.fromJson(Map<String, dynamic> json) => _$HornModelFromJson(json);

@override@JsonKey(name: 'ID') final  int? id;
@override@JsonKey(name: 'CreatedAt') final  DateTime? createdAt;
@override@JsonKey(name: 'UpdatedAt') final  DateTime? updatedAt;
@override@JsonKey(name: 'DeletedAt') final  dynamic deletedAt;
@override@JsonKey(name: 'user_id') final  int? userId;
@override final  ProfileModel? user;
@override@JsonKey(name: 'audio_path') final  String audioPath;
@override final  String title;
@override final  String? description;
@override final  double? duration;
@override final  int? size;
@override@JsonKey(name: 'approval_status') final  String? approvalStatus;

/// Create a copy of HornModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HornModelCopyWith<_HornModel> get copyWith => __$HornModelCopyWithImpl<_HornModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HornModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HornModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),userId,user,audioPath,title,description,duration,size,approvalStatus);

@override
String toString() {
  return 'HornModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, userId: $userId, user: $user, audioPath: $audioPath, title: $title, description: $description, duration: $duration, size: $size, approvalStatus: $approvalStatus)';
}


}

/// @nodoc
abstract mixin class _$HornModelCopyWith<$Res> implements $HornModelCopyWith<$Res> {
  factory _$HornModelCopyWith(_HornModel value, $Res Function(_HornModel) _then) = __$HornModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt,@JsonKey(name: 'user_id') int? userId, ProfileModel? user,@JsonKey(name: 'audio_path') String audioPath, String title, String? description, double? duration, int? size,@JsonKey(name: 'approval_status') String? approvalStatus
});


@override $ProfileModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$HornModelCopyWithImpl<$Res>
    implements _$HornModelCopyWith<$Res> {
  __$HornModelCopyWithImpl(this._self, this._then);

  final _HornModel _self;
  final $Res Function(_HornModel) _then;

/// Create a copy of HornModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? userId = freezed,Object? user = freezed,Object? audioPath = null,Object? title = null,Object? description = freezed,Object? duration = freezed,Object? size = freezed,Object? approvalStatus = freezed,}) {
  return _then(_HornModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,audioPath: null == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HornModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
