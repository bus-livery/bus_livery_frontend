// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BusTypeModel _$BusTypeModelFromJson(Map<String, dynamic> json) {
  return _BusTypeModel.fromJson(json);
}

/// @nodoc
mixin _$BusTypeModel {
  @JsonKey(name: 'bus_type')
  String? get busType => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_models')
  List<String>? get busModels => throw _privateConstructorUsedError;

  /// Serializes this BusTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusTypeModelCopyWith<BusTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusTypeModelCopyWith<$Res> {
  factory $BusTypeModelCopyWith(
    BusTypeModel value,
    $Res Function(BusTypeModel) then,
  ) = _$BusTypeModelCopyWithImpl<$Res, BusTypeModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_models') List<String>? busModels,
  });
}

/// @nodoc
class _$BusTypeModelCopyWithImpl<$Res, $Val extends BusTypeModel>
    implements $BusTypeModelCopyWith<$Res> {
  _$BusTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? busType = freezed, Object? busModels = freezed}) {
    return _then(
      _value.copyWith(
            busType:
                freezed == busType
                    ? _value.busType
                    : busType // ignore: cast_nullable_to_non_nullable
                        as String?,
            busModels:
                freezed == busModels
                    ? _value.busModels
                    : busModels // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BusTypeModelImplCopyWith<$Res>
    implements $BusTypeModelCopyWith<$Res> {
  factory _$$BusTypeModelImplCopyWith(
    _$BusTypeModelImpl value,
    $Res Function(_$BusTypeModelImpl) then,
  ) = __$$BusTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'bus_type') String? busType,
    @JsonKey(name: 'bus_models') List<String>? busModels,
  });
}

/// @nodoc
class __$$BusTypeModelImplCopyWithImpl<$Res>
    extends _$BusTypeModelCopyWithImpl<$Res, _$BusTypeModelImpl>
    implements _$$BusTypeModelImplCopyWith<$Res> {
  __$$BusTypeModelImplCopyWithImpl(
    _$BusTypeModelImpl _value,
    $Res Function(_$BusTypeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BusTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? busType = freezed, Object? busModels = freezed}) {
    return _then(
      _$BusTypeModelImpl(
        busType:
            freezed == busType
                ? _value.busType
                : busType // ignore: cast_nullable_to_non_nullable
                    as String?,
        busModels:
            freezed == busModels
                ? _value._busModels
                : busModels // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BusTypeModelImpl implements _BusTypeModel {
  _$BusTypeModelImpl({
    @JsonKey(name: 'bus_type') this.busType,
    @JsonKey(name: 'bus_models') final List<String>? busModels,
  }) : _busModels = busModels;

  factory _$BusTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusTypeModelImplFromJson(json);

  @override
  @JsonKey(name: 'bus_type')
  final String? busType;
  final List<String>? _busModels;
  @override
  @JsonKey(name: 'bus_models')
  List<String>? get busModels {
    final value = _busModels;
    if (value == null) return null;
    if (_busModels is EqualUnmodifiableListView) return _busModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BusTypeModel(busType: $busType, busModels: $busModels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusTypeModelImpl &&
            (identical(other.busType, busType) || other.busType == busType) &&
            const DeepCollectionEquality().equals(
              other._busModels,
              _busModels,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    busType,
    const DeepCollectionEquality().hash(_busModels),
  );

  /// Create a copy of BusTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusTypeModelImplCopyWith<_$BusTypeModelImpl> get copyWith =>
      __$$BusTypeModelImplCopyWithImpl<_$BusTypeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusTypeModelImplToJson(this);
  }
}

abstract class _BusTypeModel implements BusTypeModel {
  factory _BusTypeModel({
    @JsonKey(name: 'bus_type') final String? busType,
    @JsonKey(name: 'bus_models') final List<String>? busModels,
  }) = _$BusTypeModelImpl;

  factory _BusTypeModel.fromJson(Map<String, dynamic> json) =
      _$BusTypeModelImpl.fromJson;

  @override
  @JsonKey(name: 'bus_type')
  String? get busType;
  @override
  @JsonKey(name: 'bus_models')
  List<String>? get busModels;

  /// Create a copy of BusTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusTypeModelImplCopyWith<_$BusTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
