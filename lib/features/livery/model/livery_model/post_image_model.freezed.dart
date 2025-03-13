// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostImageModel _$PostImageModelFromJson(Map<String, dynamic> json) {
  return _PostImageModel.fromJson(json);
}

/// @nodoc
mixin _$PostImageModel {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeletedAt')
  dynamic get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_image_original')
  String? get postImageOriginal => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_image_1080')
  String? get postImage1080 => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_image_600')
  String? get postImage600 => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_image_200')
  String? get postImage200 => throw _privateConstructorUsedError;

  /// Serializes this PostImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostImageModelCopyWith<PostImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostImageModelCopyWith<$Res> {
  factory $PostImageModelCopyWith(
    PostImageModel value,
    $Res Function(PostImageModel) then,
  ) = _$PostImageModelCopyWithImpl<$Res, PostImageModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'post_image_original') String? postImageOriginal,
    @JsonKey(name: 'post_image_1080') String? postImage1080,
    @JsonKey(name: 'post_image_600') String? postImage600,
    @JsonKey(name: 'post_image_200') String? postImage200,
  });
}

/// @nodoc
class _$PostImageModelCopyWithImpl<$Res, $Val extends PostImageModel>
    implements $PostImageModelCopyWith<$Res> {
  _$PostImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? postImageOriginal = freezed,
    Object? postImage1080 = freezed,
    Object? postImage600 = freezed,
    Object? postImage200 = freezed,
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
            postImageOriginal:
                freezed == postImageOriginal
                    ? _value.postImageOriginal
                    : postImageOriginal // ignore: cast_nullable_to_non_nullable
                        as String?,
            postImage1080:
                freezed == postImage1080
                    ? _value.postImage1080
                    : postImage1080 // ignore: cast_nullable_to_non_nullable
                        as String?,
            postImage600:
                freezed == postImage600
                    ? _value.postImage600
                    : postImage600 // ignore: cast_nullable_to_non_nullable
                        as String?,
            postImage200:
                freezed == postImage200
                    ? _value.postImage200
                    : postImage200 // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostImageModelImplCopyWith<$Res>
    implements $PostImageModelCopyWith<$Res> {
  factory _$$PostImageModelImplCopyWith(
    _$PostImageModelImpl value,
    $Res Function(_$PostImageModelImpl) then,
  ) = __$$PostImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'post_image_original') String? postImageOriginal,
    @JsonKey(name: 'post_image_1080') String? postImage1080,
    @JsonKey(name: 'post_image_600') String? postImage600,
    @JsonKey(name: 'post_image_200') String? postImage200,
  });
}

/// @nodoc
class __$$PostImageModelImplCopyWithImpl<$Res>
    extends _$PostImageModelCopyWithImpl<$Res, _$PostImageModelImpl>
    implements _$$PostImageModelImplCopyWith<$Res> {
  __$$PostImageModelImplCopyWithImpl(
    _$PostImageModelImpl _value,
    $Res Function(_$PostImageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? postImageOriginal = freezed,
    Object? postImage1080 = freezed,
    Object? postImage600 = freezed,
    Object? postImage200 = freezed,
  }) {
    return _then(
      _$PostImageModelImpl(
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
        postImageOriginal:
            freezed == postImageOriginal
                ? _value.postImageOriginal
                : postImageOriginal // ignore: cast_nullable_to_non_nullable
                    as String?,
        postImage1080:
            freezed == postImage1080
                ? _value.postImage1080
                : postImage1080 // ignore: cast_nullable_to_non_nullable
                    as String?,
        postImage600:
            freezed == postImage600
                ? _value.postImage600
                : postImage600 // ignore: cast_nullable_to_non_nullable
                    as String?,
        postImage200:
            freezed == postImage200
                ? _value.postImage200
                : postImage200 // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImageModelImpl implements _PostImageModel {
  _$PostImageModelImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'UpdatedAt') this.updatedAt,
    @JsonKey(name: 'DeletedAt') this.deletedAt,
    @JsonKey(name: 'post_image_original') this.postImageOriginal,
    @JsonKey(name: 'post_image_1080') this.postImage1080,
    @JsonKey(name: 'post_image_600') this.postImage600,
    @JsonKey(name: 'post_image_200') this.postImage200,
  });

  factory _$PostImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImageModelImplFromJson(json);

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
  @JsonKey(name: 'post_image_original')
  final String? postImageOriginal;
  @override
  @JsonKey(name: 'post_image_1080')
  final String? postImage1080;
  @override
  @JsonKey(name: 'post_image_600')
  final String? postImage600;
  @override
  @JsonKey(name: 'post_image_200')
  final String? postImage200;

  @override
  String toString() {
    return 'PostImageModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, postImageOriginal: $postImageOriginal, postImage1080: $postImage1080, postImage600: $postImage600, postImage200: $postImage200)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.postImageOriginal, postImageOriginal) ||
                other.postImageOriginal == postImageOriginal) &&
            (identical(other.postImage1080, postImage1080) ||
                other.postImage1080 == postImage1080) &&
            (identical(other.postImage600, postImage600) ||
                other.postImage600 == postImage600) &&
            (identical(other.postImage200, postImage200) ||
                other.postImage200 == postImage200));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(deletedAt),
    postImageOriginal,
    postImage1080,
    postImage600,
    postImage200,
  );

  /// Create a copy of PostImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImageModelImplCopyWith<_$PostImageModelImpl> get copyWith =>
      __$$PostImageModelImplCopyWithImpl<_$PostImageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImageModelImplToJson(this);
  }
}

abstract class _PostImageModel implements PostImageModel {
  factory _PostImageModel({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'CreatedAt') final DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') final DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') final dynamic deletedAt,
    @JsonKey(name: 'post_image_original') final String? postImageOriginal,
    @JsonKey(name: 'post_image_1080') final String? postImage1080,
    @JsonKey(name: 'post_image_600') final String? postImage600,
    @JsonKey(name: 'post_image_200') final String? postImage200,
  }) = _$PostImageModelImpl;

  factory _PostImageModel.fromJson(Map<String, dynamic> json) =
      _$PostImageModelImpl.fromJson;

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
  @JsonKey(name: 'post_image_original')
  String? get postImageOriginal;
  @override
  @JsonKey(name: 'post_image_1080')
  String? get postImage1080;
  @override
  @JsonKey(name: 'post_image_600')
  String? get postImage600;
  @override
  @JsonKey(name: 'post_image_200')
  String? get postImage200;

  /// Create a copy of PostImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImageModelImplCopyWith<_$PostImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
