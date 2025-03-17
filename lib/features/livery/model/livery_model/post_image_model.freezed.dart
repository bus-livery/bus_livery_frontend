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

LiveryImageModel _$LiveryImageModelFromJson(Map<String, dynamic> json) {
  return _LiveryImageModel.fromJson(json);
}

/// @nodoc
mixin _$LiveryImageModel {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeletedAt')
  dynamic get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'livery_image_original')
  String? get liveryImageOriginal => throw _privateConstructorUsedError;
  @JsonKey(name: 'livery_image_1080')
  String? get liveryImage1080 => throw _privateConstructorUsedError;
  @JsonKey(name: 'livery_image_600')
  String? get livertImage600 => throw _privateConstructorUsedError;
  @JsonKey(name: 'livery_image_200')
  String? get liveryImage200 => throw _privateConstructorUsedError;

  /// Serializes this LiveryImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveryImageModelCopyWith<LiveryImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveryImageModelCopyWith<$Res> {
  factory $LiveryImageModelCopyWith(
    LiveryImageModel value,
    $Res Function(LiveryImageModel) then,
  ) = _$LiveryImageModelCopyWithImpl<$Res, LiveryImageModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'livery_image_original') String? liveryImageOriginal,
    @JsonKey(name: 'livery_image_1080') String? liveryImage1080,
    @JsonKey(name: 'livery_image_600') String? livertImage600,
    @JsonKey(name: 'livery_image_200') String? liveryImage200,
  });
}

/// @nodoc
class _$LiveryImageModelCopyWithImpl<$Res, $Val extends LiveryImageModel>
    implements $LiveryImageModelCopyWith<$Res> {
  _$LiveryImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? liveryImageOriginal = freezed,
    Object? liveryImage1080 = freezed,
    Object? livertImage600 = freezed,
    Object? liveryImage200 = freezed,
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
            liveryImageOriginal:
                freezed == liveryImageOriginal
                    ? _value.liveryImageOriginal
                    : liveryImageOriginal // ignore: cast_nullable_to_non_nullable
                        as String?,
            liveryImage1080:
                freezed == liveryImage1080
                    ? _value.liveryImage1080
                    : liveryImage1080 // ignore: cast_nullable_to_non_nullable
                        as String?,
            livertImage600:
                freezed == livertImage600
                    ? _value.livertImage600
                    : livertImage600 // ignore: cast_nullable_to_non_nullable
                        as String?,
            liveryImage200:
                freezed == liveryImage200
                    ? _value.liveryImage200
                    : liveryImage200 // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveryImageModelImplCopyWith<$Res>
    implements $LiveryImageModelCopyWith<$Res> {
  factory _$$LiveryImageModelImplCopyWith(
    _$LiveryImageModelImpl value,
    $Res Function(_$LiveryImageModelImpl) then,
  ) = __$$LiveryImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    @JsonKey(name: 'livery_image_original') String? liveryImageOriginal,
    @JsonKey(name: 'livery_image_1080') String? liveryImage1080,
    @JsonKey(name: 'livery_image_600') String? livertImage600,
    @JsonKey(name: 'livery_image_200') String? liveryImage200,
  });
}

/// @nodoc
class __$$LiveryImageModelImplCopyWithImpl<$Res>
    extends _$LiveryImageModelCopyWithImpl<$Res, _$LiveryImageModelImpl>
    implements _$$LiveryImageModelImplCopyWith<$Res> {
  __$$LiveryImageModelImplCopyWithImpl(
    _$LiveryImageModelImpl _value,
    $Res Function(_$LiveryImageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? liveryImageOriginal = freezed,
    Object? liveryImage1080 = freezed,
    Object? livertImage600 = freezed,
    Object? liveryImage200 = freezed,
  }) {
    return _then(
      _$LiveryImageModelImpl(
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
        liveryImageOriginal:
            freezed == liveryImageOriginal
                ? _value.liveryImageOriginal
                : liveryImageOriginal // ignore: cast_nullable_to_non_nullable
                    as String?,
        liveryImage1080:
            freezed == liveryImage1080
                ? _value.liveryImage1080
                : liveryImage1080 // ignore: cast_nullable_to_non_nullable
                    as String?,
        livertImage600:
            freezed == livertImage600
                ? _value.livertImage600
                : livertImage600 // ignore: cast_nullable_to_non_nullable
                    as String?,
        liveryImage200:
            freezed == liveryImage200
                ? _value.liveryImage200
                : liveryImage200 // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveryImageModelImpl implements _LiveryImageModel {
  _$LiveryImageModelImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'UpdatedAt') this.updatedAt,
    @JsonKey(name: 'DeletedAt') this.deletedAt,
    @JsonKey(name: 'livery_image_original') this.liveryImageOriginal,
    @JsonKey(name: 'livery_image_1080') this.liveryImage1080,
    @JsonKey(name: 'livery_image_600') this.livertImage600,
    @JsonKey(name: 'livery_image_200') this.liveryImage200,
  });

  factory _$LiveryImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveryImageModelImplFromJson(json);

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
  @JsonKey(name: 'livery_image_original')
  final String? liveryImageOriginal;
  @override
  @JsonKey(name: 'livery_image_1080')
  final String? liveryImage1080;
  @override
  @JsonKey(name: 'livery_image_600')
  final String? livertImage600;
  @override
  @JsonKey(name: 'livery_image_200')
  final String? liveryImage200;

  @override
  String toString() {
    return 'LiveryImageModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, liveryImageOriginal: $liveryImageOriginal, liveryImage1080: $liveryImage1080, livertImage600: $livertImage600, liveryImage200: $liveryImage200)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveryImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.liveryImageOriginal, liveryImageOriginal) ||
                other.liveryImageOriginal == liveryImageOriginal) &&
            (identical(other.liveryImage1080, liveryImage1080) ||
                other.liveryImage1080 == liveryImage1080) &&
            (identical(other.livertImage600, livertImage600) ||
                other.livertImage600 == livertImage600) &&
            (identical(other.liveryImage200, liveryImage200) ||
                other.liveryImage200 == liveryImage200));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(deletedAt),
    liveryImageOriginal,
    liveryImage1080,
    livertImage600,
    liveryImage200,
  );

  /// Create a copy of LiveryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveryImageModelImplCopyWith<_$LiveryImageModelImpl> get copyWith =>
      __$$LiveryImageModelImplCopyWithImpl<_$LiveryImageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveryImageModelImplToJson(this);
  }
}

abstract class _LiveryImageModel implements LiveryImageModel {
  factory _LiveryImageModel({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'CreatedAt') final DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') final DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') final dynamic deletedAt,
    @JsonKey(name: 'livery_image_original') final String? liveryImageOriginal,
    @JsonKey(name: 'livery_image_1080') final String? liveryImage1080,
    @JsonKey(name: 'livery_image_600') final String? livertImage600,
    @JsonKey(name: 'livery_image_200') final String? liveryImage200,
  }) = _$LiveryImageModelImpl;

  factory _LiveryImageModel.fromJson(Map<String, dynamic> json) =
      _$LiveryImageModelImpl.fromJson;

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
  @JsonKey(name: 'livery_image_original')
  String? get liveryImageOriginal;
  @override
  @JsonKey(name: 'livery_image_1080')
  String? get liveryImage1080;
  @override
  @JsonKey(name: 'livery_image_600')
  String? get livertImage600;
  @override
  @JsonKey(name: 'livery_image_200')
  String? get liveryImage200;

  /// Create a copy of LiveryImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveryImageModelImplCopyWith<_$LiveryImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
