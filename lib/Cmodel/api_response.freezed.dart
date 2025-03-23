// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ApiResponse<T> {
  dynamic get key => throw _privateConstructorUsedError;
  T? get apiData => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  ApiStatus get status => throw _privateConstructorUsedError;
  bool get paginationLoading => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
    ApiResponse<T> value,
    $Res Function(ApiResponse<T>) then,
  ) = _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({
    dynamic key,
    T? apiData,
    String? errorMessage,
    String? successMessage,
    ApiStatus status,
    bool paginationLoading,
  });
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? apiData = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? status = null,
    Object? paginationLoading = null,
  }) {
    return _then(
      _value.copyWith(
            key:
                freezed == key
                    ? _value.key
                    : key // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            apiData:
                freezed == apiData
                    ? _value.apiData
                    : apiData // ignore: cast_nullable_to_non_nullable
                        as T?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            successMessage:
                freezed == successMessage
                    ? _value.successMessage
                    : successMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as ApiStatus,
            paginationLoading:
                null == paginationLoading
                    ? _value.paginationLoading
                    : paginationLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(
    _$ApiResponseImpl<T> value,
    $Res Function(_$ApiResponseImpl<T>) then,
  ) = __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    dynamic key,
    T? apiData,
    String? errorMessage,
    String? successMessage,
    ApiStatus status,
    bool paginationLoading,
  });
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
    _$ApiResponseImpl<T> _value,
    $Res Function(_$ApiResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? apiData = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? status = null,
    Object? paginationLoading = null,
  }) {
    return _then(
      _$ApiResponseImpl<T>(
        key:
            freezed == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        apiData:
            freezed == apiData
                ? _value.apiData
                : apiData // ignore: cast_nullable_to_non_nullable
                    as T?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        successMessage:
            freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as ApiStatus,
        paginationLoading:
            null == paginationLoading
                ? _value.paginationLoading
                : paginationLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  _$ApiResponseImpl({
    this.key,
    this.apiData,
    this.errorMessage,
    this.successMessage,
    this.status = ApiStatus.initial,
    this.paginationLoading = false,
  });

  @override
  final dynamic key;
  @override
  final T? apiData;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  @JsonKey()
  final ApiStatus status;
  @override
  @JsonKey()
  final bool paginationLoading;

  @override
  String toString() {
    return 'ApiResponse<$T>(key: $key, apiData: $apiData, errorMessage: $errorMessage, successMessage: $successMessage, status: $status, paginationLoading: $paginationLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.apiData, apiData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationLoading, paginationLoading) ||
                other.paginationLoading == paginationLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(key),
    const DeepCollectionEquality().hash(apiData),
    errorMessage,
    successMessage,
    status,
    paginationLoading,
  );

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  factory _ApiResponse({
    final dynamic key,
    final T? apiData,
    final String? errorMessage,
    final String? successMessage,
    final ApiStatus status,
    final bool paginationLoading,
  }) = _$ApiResponseImpl<T>;

  @override
  dynamic get key;
  @override
  T? get apiData;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  ApiStatus get status;
  @override
  bool get paginationLoading;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
