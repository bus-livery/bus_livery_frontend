// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DownloadCountModel _$DownloadCountModelFromJson(Map<String, dynamic> json) {
  return _DownloadCountModel.fromJson(json);
}

/// @nodoc
mixin _$DownloadCountModel {
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'livery_id')
  String? get liveryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_count')
  int? get downloadCount => throw _privateConstructorUsedError;

  /// Serializes this DownloadCountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloadCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloadCountModelCopyWith<DownloadCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadCountModelCopyWith<$Res> {
  factory $DownloadCountModelCopyWith(
    DownloadCountModel value,
    $Res Function(DownloadCountModel) then,
  ) = _$DownloadCountModelCopyWithImpl<$Res, DownloadCountModel>;
  @useResult
  $Res call({
    String? message,
    @JsonKey(name: 'livery_id') String? liveryId,
    @JsonKey(name: 'download_count') int? downloadCount,
  });
}

/// @nodoc
class _$DownloadCountModelCopyWithImpl<$Res, $Val extends DownloadCountModel>
    implements $DownloadCountModelCopyWith<$Res> {
  _$DownloadCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloadCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? liveryId = freezed,
    Object? downloadCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            liveryId:
                freezed == liveryId
                    ? _value.liveryId
                    : liveryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            downloadCount:
                freezed == downloadCount
                    ? _value.downloadCount
                    : downloadCount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DownloadCountModelImplCopyWith<$Res>
    implements $DownloadCountModelCopyWith<$Res> {
  factory _$$DownloadCountModelImplCopyWith(
    _$DownloadCountModelImpl value,
    $Res Function(_$DownloadCountModelImpl) then,
  ) = __$$DownloadCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? message,
    @JsonKey(name: 'livery_id') String? liveryId,
    @JsonKey(name: 'download_count') int? downloadCount,
  });
}

/// @nodoc
class __$$DownloadCountModelImplCopyWithImpl<$Res>
    extends _$DownloadCountModelCopyWithImpl<$Res, _$DownloadCountModelImpl>
    implements _$$DownloadCountModelImplCopyWith<$Res> {
  __$$DownloadCountModelImplCopyWithImpl(
    _$DownloadCountModelImpl _value,
    $Res Function(_$DownloadCountModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DownloadCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? liveryId = freezed,
    Object? downloadCount = freezed,
  }) {
    return _then(
      _$DownloadCountModelImpl(
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        liveryId:
            freezed == liveryId
                ? _value.liveryId
                : liveryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        downloadCount:
            freezed == downloadCount
                ? _value.downloadCount
                : downloadCount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadCountModelImpl implements _DownloadCountModel {
  _$DownloadCountModelImpl({
    this.message,
    @JsonKey(name: 'livery_id') this.liveryId,
    @JsonKey(name: 'download_count') this.downloadCount,
  });

  factory _$DownloadCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadCountModelImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey(name: 'livery_id')
  final String? liveryId;
  @override
  @JsonKey(name: 'download_count')
  final int? downloadCount;

  @override
  String toString() {
    return 'DownloadCountModel(message: $message, liveryId: $liveryId, downloadCount: $downloadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadCountModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.liveryId, liveryId) ||
                other.liveryId == liveryId) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, liveryId, downloadCount);

  /// Create a copy of DownloadCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadCountModelImplCopyWith<_$DownloadCountModelImpl> get copyWith =>
      __$$DownloadCountModelImplCopyWithImpl<_$DownloadCountModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadCountModelImplToJson(this);
  }
}

abstract class _DownloadCountModel implements DownloadCountModel {
  factory _DownloadCountModel({
    final String? message,
    @JsonKey(name: 'livery_id') final String? liveryId,
    @JsonKey(name: 'download_count') final int? downloadCount,
  }) = _$DownloadCountModelImpl;

  factory _DownloadCountModel.fromJson(Map<String, dynamic> json) =
      _$DownloadCountModelImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: 'livery_id')
  String? get liveryId;
  @override
  @JsonKey(name: 'download_count')
  int? get downloadCount;

  /// Create a copy of DownloadCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadCountModelImplCopyWith<_$DownloadCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
