// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileLikeModel _$ProfileLikeModelFromJson(Map<String, dynamic> json) {
  return _ProfileLikeModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileLikeModel {
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_liked')
  bool? get profileLiked => throw _privateConstructorUsedError;

  /// Serializes this ProfileLikeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileLikeModelCopyWith<ProfileLikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileLikeModelCopyWith<$Res> {
  factory $ProfileLikeModelCopyWith(
    ProfileLikeModel value,
    $Res Function(ProfileLikeModel) then,
  ) = _$ProfileLikeModelCopyWithImpl<$Res, ProfileLikeModel>;
  @useResult
  $Res call({
    String? message,
    @JsonKey(name: 'profile_liked') bool? profileLiked,
  });
}

/// @nodoc
class _$ProfileLikeModelCopyWithImpl<$Res, $Val extends ProfileLikeModel>
    implements $ProfileLikeModelCopyWith<$Res> {
  _$ProfileLikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? profileLiked = freezed}) {
    return _then(
      _value.copyWith(
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            profileLiked:
                freezed == profileLiked
                    ? _value.profileLiked
                    : profileLiked // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileLikeModelImplCopyWith<$Res>
    implements $ProfileLikeModelCopyWith<$Res> {
  factory _$$ProfileLikeModelImplCopyWith(
    _$ProfileLikeModelImpl value,
    $Res Function(_$ProfileLikeModelImpl) then,
  ) = __$$ProfileLikeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? message,
    @JsonKey(name: 'profile_liked') bool? profileLiked,
  });
}

/// @nodoc
class __$$ProfileLikeModelImplCopyWithImpl<$Res>
    extends _$ProfileLikeModelCopyWithImpl<$Res, _$ProfileLikeModelImpl>
    implements _$$ProfileLikeModelImplCopyWith<$Res> {
  __$$ProfileLikeModelImplCopyWithImpl(
    _$ProfileLikeModelImpl _value,
    $Res Function(_$ProfileLikeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? profileLiked = freezed}) {
    return _then(
      _$ProfileLikeModelImpl(
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        profileLiked:
            freezed == profileLiked
                ? _value.profileLiked
                : profileLiked // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileLikeModelImpl implements _ProfileLikeModel {
  _$ProfileLikeModelImpl({
    this.message,
    @JsonKey(name: 'profile_liked') this.profileLiked,
  });

  factory _$ProfileLikeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileLikeModelImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey(name: 'profile_liked')
  final bool? profileLiked;

  @override
  String toString() {
    return 'ProfileLikeModel(message: $message, profileLiked: $profileLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLikeModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.profileLiked, profileLiked) ||
                other.profileLiked == profileLiked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, profileLiked);

  /// Create a copy of ProfileLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLikeModelImplCopyWith<_$ProfileLikeModelImpl> get copyWith =>
      __$$ProfileLikeModelImplCopyWithImpl<_$ProfileLikeModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileLikeModelImplToJson(this);
  }
}

abstract class _ProfileLikeModel implements ProfileLikeModel {
  factory _ProfileLikeModel({
    final String? message,
    @JsonKey(name: 'profile_liked') final bool? profileLiked,
  }) = _$ProfileLikeModelImpl;

  factory _ProfileLikeModel.fromJson(Map<String, dynamic> json) =
      _$ProfileLikeModelImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: 'profile_liked')
  bool? get profileLiked;

  /// Create a copy of ProfileLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileLikeModelImplCopyWith<_$ProfileLikeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
