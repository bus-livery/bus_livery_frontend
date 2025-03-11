// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiveryModel _$LiveryModelFromJson(Map<String, dynamic> json) {
  return _LiveryModel.fromJson(json);
}

/// @nodoc
mixin _$LiveryModel {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeletedAt')
  dynamic get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_type')
  String? get busType => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_model')
  String? get busModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_name')
  String? get postName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_count')
  int? get downloadCount => throw _privateConstructorUsedError;
  ProfileModel? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_image')
  PostImageModel? get postImage => throw _privateConstructorUsedError;

  /// Serializes this LiveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveryModelCopyWith<LiveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveryModelCopyWith<$Res> {
  factory $LiveryModelCopyWith(
    LiveryModel value,
    $Res Function(LiveryModel) then,
  ) = _$LiveryModelCopyWithImpl<$Res, LiveryModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_model') String? busModel,
    @JsonKey(name: 'post_name') String? postName,
    String? description,
    @JsonKey(name: 'download_count') int? downloadCount,
    ProfileModel? user,
    @JsonKey(name: 'post_image') PostImageModel? postImage,
  });

  $ProfileModelCopyWith<$Res>? get user;
  $PostImageModelCopyWith<$Res>? get postImage;
}

/// @nodoc
class _$LiveryModelCopyWithImpl<$Res, $Val extends LiveryModel>
    implements $LiveryModelCopyWith<$Res> {
  _$LiveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? busType = freezed,
    Object? busModel = freezed,
    Object? postName = freezed,
    Object? description = freezed,
    Object? downloadCount = freezed,
    Object? user = freezed,
    Object? postImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            deletedAt:
                freezed == deletedAt
                    ? _value.deletedAt
                    : deletedAt // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            busType:
                freezed == busType
                    ? _value.busType
                    : busType // ignore: cast_nullable_to_non_nullable
                        as String?,
            busModel:
                freezed == busModel
                    ? _value.busModel
                    : busModel // ignore: cast_nullable_to_non_nullable
                        as String?,
            postName:
                freezed == postName
                    ? _value.postName
                    : postName // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            downloadCount:
                freezed == downloadCount
                    ? _value.downloadCount
                    : downloadCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as ProfileModel?,
            postImage:
                freezed == postImage
                    ? _value.postImage
                    : postImage // ignore: cast_nullable_to_non_nullable
                        as PostImageModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostImageModelCopyWith<$Res>? get postImage {
    if (_value.postImage == null) {
      return null;
    }

    return $PostImageModelCopyWith<$Res>(_value.postImage!, (value) {
      return _then(_value.copyWith(postImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveryModelImplCopyWith<$Res>
    implements $LiveryModelCopyWith<$Res> {
  factory _$$LiveryModelImplCopyWith(
    _$LiveryModelImpl value,
    $Res Function(_$LiveryModelImpl) then,
  ) = __$$LiveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_model') String? busModel,
    @JsonKey(name: 'post_name') String? postName,
    String? description,
    @JsonKey(name: 'download_count') int? downloadCount,
    ProfileModel? user,
    @JsonKey(name: 'post_image') PostImageModel? postImage,
  });

  @override
  $ProfileModelCopyWith<$Res>? get user;
  @override
  $PostImageModelCopyWith<$Res>? get postImage;
}

/// @nodoc
class __$$LiveryModelImplCopyWithImpl<$Res>
    extends _$LiveryModelCopyWithImpl<$Res, _$LiveryModelImpl>
    implements _$$LiveryModelImplCopyWith<$Res> {
  __$$LiveryModelImplCopyWithImpl(
    _$LiveryModelImpl _value,
    $Res Function(_$LiveryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? busType = freezed,
    Object? busModel = freezed,
    Object? postName = freezed,
    Object? description = freezed,
    Object? downloadCount = freezed,
    Object? user = freezed,
    Object? postImage = freezed,
  }) {
    return _then(
      _$LiveryModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        deletedAt:
            freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        busType:
            freezed == busType
                ? _value.busType
                : busType // ignore: cast_nullable_to_non_nullable
                    as String?,
        busModel:
            freezed == busModel
                ? _value.busModel
                : busModel // ignore: cast_nullable_to_non_nullable
                    as String?,
        postName:
            freezed == postName
                ? _value.postName
                : postName // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        downloadCount:
            freezed == downloadCount
                ? _value.downloadCount
                : downloadCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as ProfileModel?,
        postImage:
            freezed == postImage
                ? _value.postImage
                : postImage // ignore: cast_nullable_to_non_nullable
                    as PostImageModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveryModelImpl implements _LiveryModel {
  _$LiveryModelImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'UpdatedAt') this.updatedAt,
    @JsonKey(name: 'DeletedAt') this.deletedAt,
    @JsonKey(name: 'bus_type') this.busType,
    @JsonKey(name: 'bus_model') this.busModel,
    @JsonKey(name: 'post_name') this.postName,
    this.description,
    @JsonKey(name: 'download_count') this.downloadCount,
    this.user,
    @JsonKey(name: 'post_image') this.postImage,
  });

  factory _$LiveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveryModelImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'CreatedAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'DeletedAt')
  final dynamic deletedAt;
  @override
  @JsonKey(name: 'bus_type')
  final String? busType;
  @override
  @JsonKey(name: 'bus_model')
  final String? busModel;
  @override
  @JsonKey(name: 'post_name')
  final String? postName;
  @override
  final String? description;
  @override
  @JsonKey(name: 'download_count')
  final int? downloadCount;
  @override
  final ProfileModel? user;
  @override
  @JsonKey(name: 'post_image')
  final PostImageModel? postImage;

  @override
  String toString() {
    return 'LiveryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, busType: $busType, busModel: $busModel, postName: $postName, description: $description, downloadCount: $downloadCount, user: $user, postImage: $postImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.busType, busType) || other.busType == busType) &&
            (identical(other.busModel, busModel) ||
                other.busModel == busModel) &&
            (identical(other.postName, postName) ||
                other.postName == postName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.postImage, postImage) ||
                other.postImage == postImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(deletedAt),
    busType,
    busModel,
    postName,
    description,
    downloadCount,
    user,
    postImage,
  );

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveryModelImplCopyWith<_$LiveryModelImpl> get copyWith =>
      __$$LiveryModelImplCopyWithImpl<_$LiveryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveryModelImplToJson(this);
  }
}

abstract class _LiveryModel implements LiveryModel {
  factory _LiveryModel({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'CreatedAt') final DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') final DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') final dynamic deletedAt,
    @JsonKey(name: 'bus_type') final String? busType,
    @JsonKey(name: 'bus_model') final String? busModel,
    @JsonKey(name: 'post_name') final String? postName,
    final String? description,
    @JsonKey(name: 'download_count') final int? downloadCount,
    final ProfileModel? user,
    @JsonKey(name: 'post_image') final PostImageModel? postImage,
  }) = _$LiveryModelImpl;

  factory _LiveryModel.fromJson(Map<String, dynamic> json) =
      _$LiveryModelImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'DeletedAt')
  dynamic get deletedAt;
  @override
  @JsonKey(name: 'bus_type')
  String? get busType;
  @override
  @JsonKey(name: 'bus_model')
  String? get busModel;
  @override
  @JsonKey(name: 'post_name')
  String? get postName;
  @override
  String? get description;
  @override
  @JsonKey(name: 'download_count')
  int? get downloadCount;
  @override
  ProfileModel? get user;
  @override
  @JsonKey(name: 'post_image')
  PostImageModel? get postImage;

  /// Create a copy of LiveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveryModelImplCopyWith<_$LiveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
