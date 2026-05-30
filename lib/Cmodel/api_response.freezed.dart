// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResponse<T> {

 dynamic get key; T? get apiData; String? get errorMessage; String? get successMessage; ApiStatus get status; int get pageCount; bool get paginationLoading;
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseCopyWith<T, ApiResponse<T>> get copyWith => _$ApiResponseCopyWithImpl<T, ApiResponse<T>>(this as ApiResponse<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse<T>&&const DeepCollectionEquality().equals(other.key, key)&&const DeepCollectionEquality().equals(other.apiData, apiData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.status, status) || other.status == status)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.paginationLoading, paginationLoading) || other.paginationLoading == paginationLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(key),const DeepCollectionEquality().hash(apiData),errorMessage,successMessage,status,pageCount,paginationLoading);

@override
String toString() {
  return 'ApiResponse<$T>(key: $key, apiData: $apiData, errorMessage: $errorMessage, successMessage: $successMessage, status: $status, pageCount: $pageCount, paginationLoading: $paginationLoading)';
}


}

/// @nodoc
abstract mixin class $ApiResponseCopyWith<T,$Res>  {
  factory $ApiResponseCopyWith(ApiResponse<T> value, $Res Function(ApiResponse<T>) _then) = _$ApiResponseCopyWithImpl;
@useResult
$Res call({
 dynamic key, T? apiData, String? errorMessage, String? successMessage, ApiStatus status, int pageCount, bool paginationLoading
});




}
/// @nodoc
class _$ApiResponseCopyWithImpl<T,$Res>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._self, this._then);

  final ApiResponse<T> _self;
  final $Res Function(ApiResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? apiData = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,Object? status = null,Object? pageCount = null,Object? paginationLoading = null,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as dynamic,apiData: freezed == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as T?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApiStatus,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,paginationLoading: null == paginationLoading ? _self.paginationLoading : paginationLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns<T> on ApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic key,  T? apiData,  String? errorMessage,  String? successMessage,  ApiStatus status,  int pageCount,  bool paginationLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that.key,_that.apiData,_that.errorMessage,_that.successMessage,_that.status,_that.pageCount,_that.paginationLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic key,  T? apiData,  String? errorMessage,  String? successMessage,  ApiStatus status,  int pageCount,  bool paginationLoading)  $default,) {final _that = this;
switch (_that) {
case _ApiResponse():
return $default(_that.key,_that.apiData,_that.errorMessage,_that.successMessage,_that.status,_that.pageCount,_that.paginationLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic key,  T? apiData,  String? errorMessage,  String? successMessage,  ApiStatus status,  int pageCount,  bool paginationLoading)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that.key,_that.apiData,_that.errorMessage,_that.successMessage,_that.status,_that.pageCount,_that.paginationLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ApiResponse<T> implements ApiResponse<T> {
   _ApiResponse({this.key, this.apiData, this.errorMessage, this.successMessage, this.status = ApiStatus.initial, this.pageCount = 1, this.paginationLoading = false});
  

@override final  dynamic key;
@override final  T? apiData;
@override final  String? errorMessage;
@override final  String? successMessage;
@override@JsonKey() final  ApiStatus status;
@override@JsonKey() final  int pageCount;
@override@JsonKey() final  bool paginationLoading;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseCopyWith<T, _ApiResponse<T>> get copyWith => __$ApiResponseCopyWithImpl<T, _ApiResponse<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponse<T>&&const DeepCollectionEquality().equals(other.key, key)&&const DeepCollectionEquality().equals(other.apiData, apiData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.status, status) || other.status == status)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.paginationLoading, paginationLoading) || other.paginationLoading == paginationLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(key),const DeepCollectionEquality().hash(apiData),errorMessage,successMessage,status,pageCount,paginationLoading);

@override
String toString() {
  return 'ApiResponse<$T>(key: $key, apiData: $apiData, errorMessage: $errorMessage, successMessage: $successMessage, status: $status, pageCount: $pageCount, paginationLoading: $paginationLoading)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory _$ApiResponseCopyWith(_ApiResponse<T> value, $Res Function(_ApiResponse<T>) _then) = __$ApiResponseCopyWithImpl;
@override @useResult
$Res call({
 dynamic key, T? apiData, String? errorMessage, String? successMessage, ApiStatus status, int pageCount, bool paginationLoading
});




}
/// @nodoc
class __$ApiResponseCopyWithImpl<T,$Res>
    implements _$ApiResponseCopyWith<T, $Res> {
  __$ApiResponseCopyWithImpl(this._self, this._then);

  final _ApiResponse<T> _self;
  final $Res Function(_ApiResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? apiData = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,Object? status = null,Object? pageCount = null,Object? paginationLoading = null,}) {
  return _then(_ApiResponse<T>(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as dynamic,apiData: freezed == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as T?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApiStatus,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,paginationLoading: null == paginationLoading ? _self.paginationLoading : paginationLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
