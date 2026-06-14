// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livery_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveryDateModel {

 List<LiveryModel>? get data; String? get message;@JsonKey(name: 'total_count') int? get totalCount;@JsonKey(name: 'per_page') int? get perPage;@JsonKey(name: 'total_pages') int? get totalPages;@JsonKey(name: 'current_page') int? get currentPages;
/// Create a copy of LiveryDateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveryDateModelCopyWith<LiveryDateModel> get copyWith => _$LiveryDateModelCopyWithImpl<LiveryDateModel>(this as LiveryDateModel, _$identity);

  /// Serializes this LiveryDateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveryDateModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPages, currentPages) || other.currentPages == currentPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message,totalCount,perPage,totalPages,currentPages);

@override
String toString() {
  return 'LiveryDateModel(data: $data, message: $message, totalCount: $totalCount, perPage: $perPage, totalPages: $totalPages, currentPages: $currentPages)';
}


}

/// @nodoc
abstract mixin class $LiveryDateModelCopyWith<$Res>  {
  factory $LiveryDateModelCopyWith(LiveryDateModel value, $Res Function(LiveryDateModel) _then) = _$LiveryDateModelCopyWithImpl;
@useResult
$Res call({
 List<LiveryModel>? data, String? message,@JsonKey(name: 'total_count') int? totalCount,@JsonKey(name: 'per_page') int? perPage,@JsonKey(name: 'total_pages') int? totalPages,@JsonKey(name: 'current_page') int? currentPages
});




}
/// @nodoc
class _$LiveryDateModelCopyWithImpl<$Res>
    implements $LiveryDateModelCopyWith<$Res> {
  _$LiveryDateModelCopyWithImpl(this._self, this._then);

  final LiveryDateModel _self;
  final $Res Function(LiveryDateModel) _then;

/// Create a copy of LiveryDateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? totalCount = freezed,Object? perPage = freezed,Object? totalPages = freezed,Object? currentPages = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<LiveryModel>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,currentPages: freezed == currentPages ? _self.currentPages : currentPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveryDateModel].
extension LiveryDateModelPatterns on LiveryDateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveryDateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveryDateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveryDateModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveryDateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveryDateModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveryDateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LiveryModel>? data,  String? message, @JsonKey(name: 'total_count')  int? totalCount, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'current_page')  int? currentPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveryDateModel() when $default != null:
return $default(_that.data,_that.message,_that.totalCount,_that.perPage,_that.totalPages,_that.currentPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LiveryModel>? data,  String? message, @JsonKey(name: 'total_count')  int? totalCount, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'current_page')  int? currentPages)  $default,) {final _that = this;
switch (_that) {
case _LiveryDateModel():
return $default(_that.data,_that.message,_that.totalCount,_that.perPage,_that.totalPages,_that.currentPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LiveryModel>? data,  String? message, @JsonKey(name: 'total_count')  int? totalCount, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'current_page')  int? currentPages)?  $default,) {final _that = this;
switch (_that) {
case _LiveryDateModel() when $default != null:
return $default(_that.data,_that.message,_that.totalCount,_that.perPage,_that.totalPages,_that.currentPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveryDateModel implements LiveryDateModel {
   _LiveryDateModel({final  List<LiveryModel>? data, this.message, @JsonKey(name: 'total_count') this.totalCount, @JsonKey(name: 'per_page') this.perPage, @JsonKey(name: 'total_pages') this.totalPages, @JsonKey(name: 'current_page') this.currentPages}): _data = data;
  factory _LiveryDateModel.fromJson(Map<String, dynamic> json) => _$LiveryDateModelFromJson(json);

 final  List<LiveryModel>? _data;
@override List<LiveryModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? message;
@override@JsonKey(name: 'total_count') final  int? totalCount;
@override@JsonKey(name: 'per_page') final  int? perPage;
@override@JsonKey(name: 'total_pages') final  int? totalPages;
@override@JsonKey(name: 'current_page') final  int? currentPages;

/// Create a copy of LiveryDateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveryDateModelCopyWith<_LiveryDateModel> get copyWith => __$LiveryDateModelCopyWithImpl<_LiveryDateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveryDateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveryDateModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPages, currentPages) || other.currentPages == currentPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),message,totalCount,perPage,totalPages,currentPages);

@override
String toString() {
  return 'LiveryDateModel(data: $data, message: $message, totalCount: $totalCount, perPage: $perPage, totalPages: $totalPages, currentPages: $currentPages)';
}


}

/// @nodoc
abstract mixin class _$LiveryDateModelCopyWith<$Res> implements $LiveryDateModelCopyWith<$Res> {
  factory _$LiveryDateModelCopyWith(_LiveryDateModel value, $Res Function(_LiveryDateModel) _then) = __$LiveryDateModelCopyWithImpl;
@override @useResult
$Res call({
 List<LiveryModel>? data, String? message,@JsonKey(name: 'total_count') int? totalCount,@JsonKey(name: 'per_page') int? perPage,@JsonKey(name: 'total_pages') int? totalPages,@JsonKey(name: 'current_page') int? currentPages
});




}
/// @nodoc
class __$LiveryDateModelCopyWithImpl<$Res>
    implements _$LiveryDateModelCopyWith<$Res> {
  __$LiveryDateModelCopyWithImpl(this._self, this._then);

  final _LiveryDateModel _self;
  final $Res Function(_LiveryDateModel) _then;

/// Create a copy of LiveryDateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? totalCount = freezed,Object? perPage = freezed,Object? totalPages = freezed,Object? currentPages = freezed,}) {
  return _then(_LiveryDateModel(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LiveryModel>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,currentPages: freezed == currentPages ? _self.currentPages : currentPages // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
