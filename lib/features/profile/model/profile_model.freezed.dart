// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeletedAt')
  dynamic get deletedAt => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get dp => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'county_code')
  int? get countyCode => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_completed')
  bool? get profileCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_status')
  bool? get activeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'violation_count')
  int? get violationCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int? get likeCount => throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    String? username,
    String? dp,
    String? phone,
    @JsonKey(name: 'county_code') int? countyCode,
    String? email,
    String? description,
    @JsonKey(name: 'profile_completed') bool? profileCompleted,
    @JsonKey(name: 'active_status') bool? activeStatus,
    @JsonKey(name: 'violation_count') int? violationCount,
    @JsonKey(name: 'like_count') int? likeCount,
  });
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? username = freezed,
    Object? dp = freezed,
    Object? phone = freezed,
    Object? countyCode = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? profileCompleted = freezed,
    Object? activeStatus = freezed,
    Object? violationCount = freezed,
    Object? likeCount = freezed,
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
            username:
                freezed == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String?,
            dp:
                freezed == dp
                    ? _value.dp
                    : dp // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            countyCode:
                freezed == countyCode
                    ? _value.countyCode
                    : countyCode // ignore: cast_nullable_to_non_nullable
                        as int?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            profileCompleted:
                freezed == profileCompleted
                    ? _value.profileCompleted
                    : profileCompleted // ignore: cast_nullable_to_non_nullable
                        as bool?,
            activeStatus:
                freezed == activeStatus
                    ? _value.activeStatus
                    : activeStatus // ignore: cast_nullable_to_non_nullable
                        as bool?,
            violationCount:
                freezed == violationCount
                    ? _value.violationCount
                    : violationCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            likeCount:
                freezed == likeCount
                    ? _value.likeCount
                    : likeCount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') dynamic deletedAt,
    String? username,
    String? dp,
    String? phone,
    @JsonKey(name: 'county_code') int? countyCode,
    String? email,
    String? description,
    @JsonKey(name: 'profile_completed') bool? profileCompleted,
    @JsonKey(name: 'active_status') bool? activeStatus,
    @JsonKey(name: 'violation_count') int? violationCount,
    @JsonKey(name: 'like_count') int? likeCount,
  });
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? username = freezed,
    Object? dp = freezed,
    Object? phone = freezed,
    Object? countyCode = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? profileCompleted = freezed,
    Object? activeStatus = freezed,
    Object? violationCount = freezed,
    Object? likeCount = freezed,
  }) {
    return _then(
      _$ProfileModelImpl(
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
        username:
            freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String?,
        dp:
            freezed == dp
                ? _value.dp
                : dp // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        countyCode:
            freezed == countyCode
                ? _value.countyCode
                : countyCode // ignore: cast_nullable_to_non_nullable
                    as int?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        profileCompleted:
            freezed == profileCompleted
                ? _value.profileCompleted
                : profileCompleted // ignore: cast_nullable_to_non_nullable
                    as bool?,
        activeStatus:
            freezed == activeStatus
                ? _value.activeStatus
                : activeStatus // ignore: cast_nullable_to_non_nullable
                    as bool?,
        violationCount:
            freezed == violationCount
                ? _value.violationCount
                : violationCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        likeCount:
            freezed == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl implements _ProfileModel {
  _$ProfileModelImpl({
    @JsonKey(name: 'ID') this.id,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'UpdatedAt') this.updatedAt,
    @JsonKey(name: 'DeletedAt') this.deletedAt,
    this.username,
    this.dp,
    this.phone,
    @JsonKey(name: 'county_code') this.countyCode,
    this.email,
    this.description,
    @JsonKey(name: 'profile_completed') this.profileCompleted,
    @JsonKey(name: 'active_status') this.activeStatus,
    @JsonKey(name: 'violation_count') this.violationCount,
    @JsonKey(name: 'like_count') this.likeCount,
  });

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

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
  final String? username;
  @override
  final String? dp;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'county_code')
  final int? countyCode;
  @override
  final String? email;
  @override
  final String? description;
  @override
  @JsonKey(name: 'profile_completed')
  final bool? profileCompleted;
  @override
  @JsonKey(name: 'active_status')
  final bool? activeStatus;
  @override
  @JsonKey(name: 'violation_count')
  final int? violationCount;
  @override
  @JsonKey(name: 'like_count')
  final int? likeCount;

  @override
  String toString() {
    return 'ProfileModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, username: $username, dp: $dp, phone: $phone, countyCode: $countyCode, email: $email, description: $description, profileCompleted: $profileCompleted, activeStatus: $activeStatus, violationCount: $violationCount, likeCount: $likeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.countyCode, countyCode) ||
                other.countyCode == countyCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.profileCompleted, profileCompleted) ||
                other.profileCompleted == profileCompleted) &&
            (identical(other.activeStatus, activeStatus) ||
                other.activeStatus == activeStatus) &&
            (identical(other.violationCount, violationCount) ||
                other.violationCount == violationCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(deletedAt),
    username,
    dp,
    phone,
    countyCode,
    email,
    description,
    profileCompleted,
    activeStatus,
    violationCount,
    likeCount,
  );

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(this);
  }
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel({
    @JsonKey(name: 'ID') final int? id,
    @JsonKey(name: 'CreatedAt') final DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') final DateTime? updatedAt,
    @JsonKey(name: 'DeletedAt') final dynamic deletedAt,
    final String? username,
    final String? dp,
    final String? phone,
    @JsonKey(name: 'county_code') final int? countyCode,
    final String? email,
    final String? description,
    @JsonKey(name: 'profile_completed') final bool? profileCompleted,
    @JsonKey(name: 'active_status') final bool? activeStatus,
    @JsonKey(name: 'violation_count') final int? violationCount,
    @JsonKey(name: 'like_count') final int? likeCount,
  }) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

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
  String? get username;
  @override
  String? get dp;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'county_code')
  int? get countyCode;
  @override
  String? get email;
  @override
  String? get description;
  @override
  @JsonKey(name: 'profile_completed')
  bool? get profileCompleted;
  @override
  @JsonKey(name: 'active_status')
  bool? get activeStatus;
  @override
  @JsonKey(name: 'violation_count')
  int? get violationCount;
  @override
  @JsonKey(name: 'like_count')
  int? get likeCount;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
