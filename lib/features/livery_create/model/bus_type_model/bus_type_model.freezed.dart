// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusTypeModel {

@JsonKey(name: 'bus_type') String? get busType;@JsonKey(name: 'bus_models') List<String>? get busModels;
/// Create a copy of BusTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusTypeModelCopyWith<BusTypeModel> get copyWith => _$BusTypeModelCopyWithImpl<BusTypeModel>(this as BusTypeModel, _$identity);

  /// Serializes this BusTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusTypeModel&&(identical(other.busType, busType) || other.busType == busType)&&const DeepCollectionEquality().equals(other.busModels, busModels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,busType,const DeepCollectionEquality().hash(busModels));

@override
String toString() {
  return 'BusTypeModel(busType: $busType, busModels: $busModels)';
}


}

/// @nodoc
abstract mixin class $BusTypeModelCopyWith<$Res>  {
  factory $BusTypeModelCopyWith(BusTypeModel value, $Res Function(BusTypeModel) _then) = _$BusTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'bus_type') String? busType,@JsonKey(name: 'bus_models') List<String>? busModels
});




}
/// @nodoc
class _$BusTypeModelCopyWithImpl<$Res>
    implements $BusTypeModelCopyWith<$Res> {
  _$BusTypeModelCopyWithImpl(this._self, this._then);

  final BusTypeModel _self;
  final $Res Function(BusTypeModel) _then;

/// Create a copy of BusTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? busType = freezed,Object? busModels = freezed,}) {
  return _then(_self.copyWith(
busType: freezed == busType ? _self.busType : busType // ignore: cast_nullable_to_non_nullable
as String?,busModels: freezed == busModels ? _self.busModels : busModels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusTypeModel].
extension BusTypeModelPatterns on BusTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _BusTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _BusTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_models')  List<String>? busModels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusTypeModel() when $default != null:
return $default(_that.busType,_that.busModels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_models')  List<String>? busModels)  $default,) {final _that = this;
switch (_that) {
case _BusTypeModel():
return $default(_that.busType,_that.busModels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'bus_type')  String? busType, @JsonKey(name: 'bus_models')  List<String>? busModels)?  $default,) {final _that = this;
switch (_that) {
case _BusTypeModel() when $default != null:
return $default(_that.busType,_that.busModels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusTypeModel implements BusTypeModel {
   _BusTypeModel({@JsonKey(name: 'bus_type') this.busType, @JsonKey(name: 'bus_models') final  List<String>? busModels}): _busModels = busModels;
  factory _BusTypeModel.fromJson(Map<String, dynamic> json) => _$BusTypeModelFromJson(json);

@override@JsonKey(name: 'bus_type') final  String? busType;
 final  List<String>? _busModels;
@override@JsonKey(name: 'bus_models') List<String>? get busModels {
  final value = _busModels;
  if (value == null) return null;
  if (_busModels is EqualUnmodifiableListView) return _busModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BusTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusTypeModelCopyWith<_BusTypeModel> get copyWith => __$BusTypeModelCopyWithImpl<_BusTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusTypeModel&&(identical(other.busType, busType) || other.busType == busType)&&const DeepCollectionEquality().equals(other._busModels, _busModels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,busType,const DeepCollectionEquality().hash(_busModels));

@override
String toString() {
  return 'BusTypeModel(busType: $busType, busModels: $busModels)';
}


}

/// @nodoc
abstract mixin class _$BusTypeModelCopyWith<$Res> implements $BusTypeModelCopyWith<$Res> {
  factory _$BusTypeModelCopyWith(_BusTypeModel value, $Res Function(_BusTypeModel) _then) = __$BusTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'bus_type') String? busType,@JsonKey(name: 'bus_models') List<String>? busModels
});




}
/// @nodoc
class __$BusTypeModelCopyWithImpl<$Res>
    implements _$BusTypeModelCopyWith<$Res> {
  __$BusTypeModelCopyWithImpl(this._self, this._then);

  final _BusTypeModel _self;
  final $Res Function(_BusTypeModel) _then;

/// Create a copy of BusTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? busType = freezed,Object? busModels = freezed,}) {
  return _then(_BusTypeModel(
busType: freezed == busType ? _self.busType : busType // ignore: cast_nullable_to_non_nullable
as String?,busModels: freezed == busModels ? _self._busModels : busModels // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
