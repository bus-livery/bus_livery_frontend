// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livery_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiveryDateModel _$LiveryDateModelFromJson(Map<String, dynamic> json) {
  return _LiveryDateModel.fromJson(json);
}

/// @nodoc
mixin _$LiveryDateModel {
  List<LiveryModel>? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPages => throw _privateConstructorUsedError;

  /// Serializes this LiveryDateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveryDateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveryDateModelCopyWith<LiveryDateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveryDateModelCopyWith<$Res> {
  factory $LiveryDateModelCopyWith(
    LiveryDateModel value,
    $Res Function(LiveryDateModel) then,
  ) = _$LiveryDateModelCopyWithImpl<$Res, LiveryDateModel>;
  @useResult
  $Res call({
    List<LiveryModel>? data,
    String? message,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'current_page') int? currentPages,
  });
}

/// @nodoc
class _$LiveryDateModelCopyWithImpl<$Res, $Val extends LiveryDateModel>
    implements $LiveryDateModelCopyWith<$Res> {
  _$LiveryDateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveryDateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? totalCount = freezed,
    Object? perPage = freezed,
    Object? totalPages = freezed,
    Object? currentPages = freezed,
  }) {
    return _then(
      _value.copyWith(
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as List<LiveryModel>?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            totalCount:
                freezed == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            perPage:
                freezed == perPage
                    ? _value.perPage
                    : perPage // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalPages:
                freezed == totalPages
                    ? _value.totalPages
                    : totalPages // ignore: cast_nullable_to_non_nullable
                        as int?,
            currentPages:
                freezed == currentPages
                    ? _value.currentPages
                    : currentPages // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveryDateModelImplCopyWith<$Res>
    implements $LiveryDateModelCopyWith<$Res> {
  factory _$$LiveryDateModelImplCopyWith(
    _$LiveryDateModelImpl value,
    $Res Function(_$LiveryDateModelImpl) then,
  ) = __$$LiveryDateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<LiveryModel>? data,
    String? message,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'current_page') int? currentPages,
  });
}

/// @nodoc
class __$$LiveryDateModelImplCopyWithImpl<$Res>
    extends _$LiveryDateModelCopyWithImpl<$Res, _$LiveryDateModelImpl>
    implements _$$LiveryDateModelImplCopyWith<$Res> {
  __$$LiveryDateModelImplCopyWithImpl(
    _$LiveryDateModelImpl _value,
    $Res Function(_$LiveryDateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveryDateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? totalCount = freezed,
    Object? perPage = freezed,
    Object? totalPages = freezed,
    Object? currentPages = freezed,
  }) {
    return _then(
      _$LiveryDateModelImpl(
        data:
            freezed == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<LiveryModel>?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        totalCount:
            freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        perPage:
            freezed == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalPages:
            freezed == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                    as int?,
        currentPages:
            freezed == currentPages
                ? _value.currentPages
                : currentPages // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveryDateModelImpl implements _LiveryDateModel {
  _$LiveryDateModelImpl({
    final List<LiveryModel>? data,
    this.message,
    @JsonKey(name: 'total_count') this.totalCount,
    @JsonKey(name: 'per_page') this.perPage,
    @JsonKey(name: 'total_pages') this.totalPages,
    @JsonKey(name: 'current_page') this.currentPages,
  }) : _data = data;

  factory _$LiveryDateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveryDateModelImplFromJson(json);

  final List<LiveryModel>? _data;
  @override
  List<LiveryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;
  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @override
  @JsonKey(name: 'current_page')
  final int? currentPages;

  @override
  String toString() {
    return 'LiveryDateModel(data: $data, message: $message, totalCount: $totalCount, perPage: $perPage, totalPages: $totalPages, currentPages: $currentPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveryDateModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPages, currentPages) ||
                other.currentPages == currentPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    message,
    totalCount,
    perPage,
    totalPages,
    currentPages,
  );

  /// Create a copy of LiveryDateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveryDateModelImplCopyWith<_$LiveryDateModelImpl> get copyWith =>
      __$$LiveryDateModelImplCopyWithImpl<_$LiveryDateModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveryDateModelImplToJson(this);
  }
}

abstract class _LiveryDateModel implements LiveryDateModel {
  factory _LiveryDateModel({
    final List<LiveryModel>? data,
    final String? message,
    @JsonKey(name: 'total_count') final int? totalCount,
    @JsonKey(name: 'per_page') final int? perPage,
    @JsonKey(name: 'total_pages') final int? totalPages,
    @JsonKey(name: 'current_page') final int? currentPages,
  }) = _$LiveryDateModelImpl;

  factory _LiveryDateModel.fromJson(Map<String, dynamic> json) =
      _$LiveryDateModelImpl.fromJson;

  @override
  List<LiveryModel>? get data;
  @override
  String? get message;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPages;

  /// Create a copy of LiveryDateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveryDateModelImplCopyWith<_$LiveryDateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
