// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveryModel {

@JsonKey(name: 'ID') int? get id;@JsonKey(name: 'CreatedAt') DateTime? get createdAt;@JsonKey(name: 'UpdatedAt') DateTime? get updatedAt;@JsonKey(name: 'DeletedAt') dynamic get deletedAt;@JsonKey(name: 'bus_type') String? get busType;@JsonKey(name: 'bus_model') String? get busModel;@JsonKey(name: 'livery_name') String? get liveryName; String? get description;@JsonKey(name: 'download_count') int? get downloadCount; ProfileModel? get user;@JsonKey(name: 'livery_image') LiveryImageModel? get postImage;@JsonKey(name: 'approval_status') String? get approvalStatus;@JsonKey(name: 'post') LiveryModel? get post;
/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveryModelCopyWith<LiveryModel> get copyWith => _$LiveryModelCopyWithImpl<LiveryModel>(this as LiveryModel, _$identity);

  /// Serializes this LiveryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.busType, busType) || other.busType == busType)&&(identical(other.busModel, busModel) || other.busModel == busModel)&&(identical(other.liveryName, liveryName) || other.liveryName == liveryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.user, user) || other.user == user)&&(identical(other.postImage, postImage) || other.postImage == postImage)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.post, post) || other.post == post));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),busType,busModel,liveryName,description,downloadCount,user,postImage,approvalStatus,post);

@override
String toString() {
  return 'LiveryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, busType: $busType, busModel: $busModel, liveryName: $liveryName, description: $description, downloadCount: $downloadCount, user: $user, postImage: $postImage, approvalStatus: $approvalStatus, post: $post)';
}


}

/// @nodoc
abstract mixin class $LiveryModelCopyWith<$Res>  {
  factory $LiveryModelCopyWith(LiveryModel value, $Res Function(LiveryModel) _then) = _$LiveryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt,@JsonKey(name: 'bus_type') String? busType,@JsonKey(name: 'bus_model') String? busModel,@JsonKey(name: 'livery_name') String? liveryName, String? description,@JsonKey(name: 'download_count') int? downloadCount, ProfileModel? user,@JsonKey(name: 'livery_image') LiveryImageModel? postImage,@JsonKey(name: 'approval_status') String? approvalStatus,@JsonKey(name: 'post') LiveryModel? post
});


$ProfileModelCopyWith<$Res>? get user;$LiveryImageModelCopyWith<$Res>? get postImage;$LiveryModelCopyWith<$Res>? get post;

}
/// @nodoc
class _$LiveryModelCopyWithImpl<$Res>
    implements $LiveryModelCopyWith<$Res> {
  _$LiveryModelCopyWithImpl(this._self, this._then);

  final LiveryModel _self;
  final $Res Function(LiveryModel) _then;

/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? busType = freezed,Object? busModel = freezed,Object? liveryName = freezed,Object? description = freezed,Object? downloadCount = freezed,Object? user = freezed,Object? postImage = freezed,Object? approvalStatus = freezed,Object? post = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,busType: freezed == busType ? _self.busType : busType // ignore: cast_nullable_to_non_nullable
as String?,busModel: freezed == busModel ? _self.busModel : busModel // ignore: cast_nullable_to_non_nullable
as String?,liveryName: freezed == liveryName ? _self.liveryName : liveryName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,postImage: freezed == postImage ? _self.postImage : postImage // ignore: cast_nullable_to_non_nullable
as LiveryImageModel?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as LiveryModel?,
  ));
}
/// Create a copy of LiveryModel
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
}/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveryImageModelCopyWith<$Res>? get postImage {
    if (_self.postImage == null) {
    return null;
  }

  return $LiveryImageModelCopyWith<$Res>(_self.postImage!, (value) {
    return _then(_self.copyWith(postImage: value));
  });
}/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveryModelCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $LiveryModelCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveryModel].
extension LiveryModelPatterns on LiveryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveryModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveryModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_model')  String? busModel, @JsonKey(name: 'livery_name')  String? liveryName,  String? description, @JsonKey(name: 'download_count')  int? downloadCount,  ProfileModel? user, @JsonKey(name: 'livery_image')  LiveryImageModel? postImage, @JsonKey(name: 'approval_status')  String? approvalStatus, @JsonKey(name: 'post')  LiveryModel? post)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveryModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.busType,_that.busModel,_that.liveryName,_that.description,_that.downloadCount,_that.user,_that.postImage,_that.approvalStatus,_that.post);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_model')  String? busModel, @JsonKey(name: 'livery_name')  String? liveryName,  String? description, @JsonKey(name: 'download_count')  int? downloadCount,  ProfileModel? user, @JsonKey(name: 'livery_image')  LiveryImageModel? postImage, @JsonKey(name: 'approval_status')  String? approvalStatus, @JsonKey(name: 'post')  LiveryModel? post)  $default,) {final _that = this;
switch (_that) {
case _LiveryModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.busType,_that.busModel,_that.liveryName,_that.description,_that.downloadCount,_that.user,_that.postImage,_that.approvalStatus,_that.post);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt, @JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_model')  String? busModel, @JsonKey(name: 'livery_name')  String? liveryName,  String? description, @JsonKey(name: 'download_count')  int? downloadCount,  ProfileModel? user, @JsonKey(name: 'livery_image')  LiveryImageModel? postImage, @JsonKey(name: 'approval_status')  String? approvalStatus, @JsonKey(name: 'post')  LiveryModel? post)?  $default,) {final _that = this;
switch (_that) {
case _LiveryModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.busType,_that.busModel,_that.liveryName,_that.description,_that.downloadCount,_that.user,_that.postImage,_that.approvalStatus,_that.post);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveryModel implements LiveryModel {
   _LiveryModel({@JsonKey(name: 'ID') this.id, @JsonKey(name: 'CreatedAt') this.createdAt, @JsonKey(name: 'UpdatedAt') this.updatedAt, @JsonKey(name: 'DeletedAt') this.deletedAt, @JsonKey(name: 'bus_type') this.busType, @JsonKey(name: 'bus_model') this.busModel, @JsonKey(name: 'livery_name') this.liveryName, this.description, @JsonKey(name: 'download_count') this.downloadCount, this.user, @JsonKey(name: 'livery_image') this.postImage, @JsonKey(name: 'approval_status') this.approvalStatus, @JsonKey(name: 'post') this.post});
  factory _LiveryModel.fromJson(Map<String, dynamic> json) => _$LiveryModelFromJson(json);

@override@JsonKey(name: 'ID') final  int? id;
@override@JsonKey(name: 'CreatedAt') final  DateTime? createdAt;
@override@JsonKey(name: 'UpdatedAt') final  DateTime? updatedAt;
@override@JsonKey(name: 'DeletedAt') final  dynamic deletedAt;
@override@JsonKey(name: 'bus_type') final  String? busType;
@override@JsonKey(name: 'bus_model') final  String? busModel;
@override@JsonKey(name: 'livery_name') final  String? liveryName;
@override final  String? description;
@override@JsonKey(name: 'download_count') final  int? downloadCount;
@override final  ProfileModel? user;
@override@JsonKey(name: 'livery_image') final  LiveryImageModel? postImage;
@override@JsonKey(name: 'approval_status') final  String? approvalStatus;
@override@JsonKey(name: 'post') final  LiveryModel? post;

/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveryModelCopyWith<_LiveryModel> get copyWith => __$LiveryModelCopyWithImpl<_LiveryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.busType, busType) || other.busType == busType)&&(identical(other.busModel, busModel) || other.busModel == busModel)&&(identical(other.liveryName, liveryName) || other.liveryName == liveryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.user, user) || other.user == user)&&(identical(other.postImage, postImage) || other.postImage == postImage)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.post, post) || other.post == post));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),busType,busModel,liveryName,description,downloadCount,user,postImage,approvalStatus,post);

@override
String toString() {
  return 'LiveryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, busType: $busType, busModel: $busModel, liveryName: $liveryName, description: $description, downloadCount: $downloadCount, user: $user, postImage: $postImage, approvalStatus: $approvalStatus, post: $post)';
}


}

/// @nodoc
abstract mixin class _$LiveryModelCopyWith<$Res> implements $LiveryModelCopyWith<$Res> {
  factory _$LiveryModelCopyWith(_LiveryModel value, $Res Function(_LiveryModel) _then) = __$LiveryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt,@JsonKey(name: 'bus_type') String? busType,@JsonKey(name: 'bus_model') String? busModel,@JsonKey(name: 'livery_name') String? liveryName, String? description,@JsonKey(name: 'download_count') int? downloadCount, ProfileModel? user,@JsonKey(name: 'livery_image') LiveryImageModel? postImage,@JsonKey(name: 'approval_status') String? approvalStatus,@JsonKey(name: 'post') LiveryModel? post
});


@override $ProfileModelCopyWith<$Res>? get user;@override $LiveryImageModelCopyWith<$Res>? get postImage;@override $LiveryModelCopyWith<$Res>? get post;

}
/// @nodoc
class __$LiveryModelCopyWithImpl<$Res>
    implements _$LiveryModelCopyWith<$Res> {
  __$LiveryModelCopyWithImpl(this._self, this._then);

  final _LiveryModel _self;
  final $Res Function(_LiveryModel) _then;

/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? busType = freezed,Object? busModel = freezed,Object? liveryName = freezed,Object? description = freezed,Object? downloadCount = freezed,Object? user = freezed,Object? postImage = freezed,Object? approvalStatus = freezed,Object? post = freezed,}) {
  return _then(_LiveryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,busType: freezed == busType ? _self.busType : busType // ignore: cast_nullable_to_non_nullable
as String?,busModel: freezed == busModel ? _self.busModel : busModel // ignore: cast_nullable_to_non_nullable
as String?,liveryName: freezed == liveryName ? _self.liveryName : liveryName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,postImage: freezed == postImage ? _self.postImage : postImage // ignore: cast_nullable_to_non_nullable
as LiveryImageModel?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as LiveryModel?,
  ));
}

/// Create a copy of LiveryModel
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
}/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveryImageModelCopyWith<$Res>? get postImage {
    if (_self.postImage == null) {
    return null;
  }

  return $LiveryImageModelCopyWith<$Res>(_self.postImage!, (value) {
    return _then(_self.copyWith(postImage: value));
  });
}/// Create a copy of LiveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveryModelCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $LiveryModelCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
