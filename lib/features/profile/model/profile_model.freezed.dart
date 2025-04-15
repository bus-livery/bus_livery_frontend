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
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'profile_liked')
  bool? get profileLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_livery')
  int? get totalLivery => throw _privateConstructorUsedError; // Username Controller
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get usernameCtr => throw _privateConstructorUsedError; // Country code Controller
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get countryCodeCtr =>
      throw _privateConstructorUsedError; // Phone Number Controller
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get phoneNoCtr => throw _privateConstructorUsedError; // Email Controller
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get emailCtr => throw _privateConstructorUsedError; // Description Controller
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get descriptionCtr =>
      throw _privateConstructorUsedError;

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
    @JsonKey(name: 'country_code') String? countryCode,
    String? email,
    String? description,
    @JsonKey(name: 'profile_completed') bool? profileCompleted,
    @JsonKey(name: 'active_status') bool? activeStatus,
    @JsonKey(name: 'violation_count') int? violationCount,
    @JsonKey(name: 'like_count') int? likeCount,
    @JsonKey(name: 'profile_liked') bool? profileLiked,
    @JsonKey(name: 'total_livery') int? totalLivery,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? usernameCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? countryCodeCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? phoneNoCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? emailCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? descriptionCtr,
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
    Object? countryCode = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? profileCompleted = freezed,
    Object? activeStatus = freezed,
    Object? violationCount = freezed,
    Object? likeCount = freezed,
    Object? profileLiked = freezed,
    Object? totalLivery = freezed,
    Object? usernameCtr = freezed,
    Object? countryCodeCtr = freezed,
    Object? phoneNoCtr = freezed,
    Object? emailCtr = freezed,
    Object? descriptionCtr = freezed,
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
            countryCode:
                freezed == countryCode
                    ? _value.countryCode
                    : countryCode // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            profileLiked:
                freezed == profileLiked
                    ? _value.profileLiked
                    : profileLiked // ignore: cast_nullable_to_non_nullable
                        as bool?,
            totalLivery:
                freezed == totalLivery
                    ? _value.totalLivery
                    : totalLivery // ignore: cast_nullable_to_non_nullable
                        as int?,
            usernameCtr:
                freezed == usernameCtr
                    ? _value.usernameCtr
                    : usernameCtr // ignore: cast_nullable_to_non_nullable
                        as TextEditingController?,
            countryCodeCtr:
                freezed == countryCodeCtr
                    ? _value.countryCodeCtr
                    : countryCodeCtr // ignore: cast_nullable_to_non_nullable
                        as TextEditingController?,
            phoneNoCtr:
                freezed == phoneNoCtr
                    ? _value.phoneNoCtr
                    : phoneNoCtr // ignore: cast_nullable_to_non_nullable
                        as TextEditingController?,
            emailCtr:
                freezed == emailCtr
                    ? _value.emailCtr
                    : emailCtr // ignore: cast_nullable_to_non_nullable
                        as TextEditingController?,
            descriptionCtr:
                freezed == descriptionCtr
                    ? _value.descriptionCtr
                    : descriptionCtr // ignore: cast_nullable_to_non_nullable
                        as TextEditingController?,
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
    @JsonKey(name: 'country_code') String? countryCode,
    String? email,
    String? description,
    @JsonKey(name: 'profile_completed') bool? profileCompleted,
    @JsonKey(name: 'active_status') bool? activeStatus,
    @JsonKey(name: 'violation_count') int? violationCount,
    @JsonKey(name: 'like_count') int? likeCount,
    @JsonKey(name: 'profile_liked') bool? profileLiked,
    @JsonKey(name: 'total_livery') int? totalLivery,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? usernameCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? countryCodeCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? phoneNoCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? emailCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    TextEditingController? descriptionCtr,
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
    Object? countryCode = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? profileCompleted = freezed,
    Object? activeStatus = freezed,
    Object? violationCount = freezed,
    Object? likeCount = freezed,
    Object? profileLiked = freezed,
    Object? totalLivery = freezed,
    Object? usernameCtr = freezed,
    Object? countryCodeCtr = freezed,
    Object? phoneNoCtr = freezed,
    Object? emailCtr = freezed,
    Object? descriptionCtr = freezed,
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
        countryCode:
            freezed == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        profileLiked:
            freezed == profileLiked
                ? _value.profileLiked
                : profileLiked // ignore: cast_nullable_to_non_nullable
                    as bool?,
        totalLivery:
            freezed == totalLivery
                ? _value.totalLivery
                : totalLivery // ignore: cast_nullable_to_non_nullable
                    as int?,
        usernameCtr:
            freezed == usernameCtr
                ? _value.usernameCtr
                : usernameCtr // ignore: cast_nullable_to_non_nullable
                    as TextEditingController?,
        countryCodeCtr:
            freezed == countryCodeCtr
                ? _value.countryCodeCtr
                : countryCodeCtr // ignore: cast_nullable_to_non_nullable
                    as TextEditingController?,
        phoneNoCtr:
            freezed == phoneNoCtr
                ? _value.phoneNoCtr
                : phoneNoCtr // ignore: cast_nullable_to_non_nullable
                    as TextEditingController?,
        emailCtr:
            freezed == emailCtr
                ? _value.emailCtr
                : emailCtr // ignore: cast_nullable_to_non_nullable
                    as TextEditingController?,
        descriptionCtr:
            freezed == descriptionCtr
                ? _value.descriptionCtr
                : descriptionCtr // ignore: cast_nullable_to_non_nullable
                    as TextEditingController?,
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
    @JsonKey(name: 'country_code') this.countryCode,
    this.email,
    this.description,
    @JsonKey(name: 'profile_completed') this.profileCompleted,
    @JsonKey(name: 'active_status') this.activeStatus,
    @JsonKey(name: 'violation_count') this.violationCount,
    @JsonKey(name: 'like_count') this.likeCount,
    @JsonKey(name: 'profile_liked') this.profileLiked,
    @JsonKey(name: 'total_livery') this.totalLivery,
    @JsonKey(includeFromJson: false, includeToJson: false) this.usernameCtr,
    @JsonKey(includeFromJson: false, includeToJson: false) this.countryCodeCtr,
    @JsonKey(includeFromJson: false, includeToJson: false) this.phoneNoCtr,
    @JsonKey(includeFromJson: false, includeToJson: false) this.emailCtr,
    @JsonKey(includeFromJson: false, includeToJson: false) this.descriptionCtr,
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
  @JsonKey(name: 'country_code')
  final String? countryCode;
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
  @JsonKey(name: 'profile_liked')
  final bool? profileLiked;
  @override
  @JsonKey(name: 'total_livery')
  final int? totalLivery;
  // Username Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController? usernameCtr;
  // Country code Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController? countryCodeCtr;
  // Phone Number Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController? phoneNoCtr;
  // Email Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController? emailCtr;
  // Description Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController? descriptionCtr;

  @override
  String toString() {
    return 'ProfileModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, username: $username, dp: $dp, phone: $phone, countryCode: $countryCode, email: $email, description: $description, profileCompleted: $profileCompleted, activeStatus: $activeStatus, violationCount: $violationCount, likeCount: $likeCount, profileLiked: $profileLiked, totalLivery: $totalLivery, usernameCtr: $usernameCtr, countryCodeCtr: $countryCodeCtr, phoneNoCtr: $phoneNoCtr, emailCtr: $emailCtr, descriptionCtr: $descriptionCtr)';
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
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
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
                other.likeCount == likeCount) &&
            (identical(other.profileLiked, profileLiked) ||
                other.profileLiked == profileLiked) &&
            (identical(other.totalLivery, totalLivery) ||
                other.totalLivery == totalLivery) &&
            (identical(other.usernameCtr, usernameCtr) ||
                other.usernameCtr == usernameCtr) &&
            (identical(other.countryCodeCtr, countryCodeCtr) ||
                other.countryCodeCtr == countryCodeCtr) &&
            (identical(other.phoneNoCtr, phoneNoCtr) ||
                other.phoneNoCtr == phoneNoCtr) &&
            (identical(other.emailCtr, emailCtr) ||
                other.emailCtr == emailCtr) &&
            (identical(other.descriptionCtr, descriptionCtr) ||
                other.descriptionCtr == descriptionCtr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(deletedAt),
    username,
    dp,
    phone,
    countryCode,
    email,
    description,
    profileCompleted,
    activeStatus,
    violationCount,
    likeCount,
    profileLiked,
    totalLivery,
    usernameCtr,
    countryCodeCtr,
    phoneNoCtr,
    emailCtr,
    descriptionCtr,
  ]);

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
    @JsonKey(name: 'country_code') final String? countryCode,
    final String? email,
    final String? description,
    @JsonKey(name: 'profile_completed') final bool? profileCompleted,
    @JsonKey(name: 'active_status') final bool? activeStatus,
    @JsonKey(name: 'violation_count') final int? violationCount,
    @JsonKey(name: 'like_count') final int? likeCount,
    @JsonKey(name: 'profile_liked') final bool? profileLiked,
    @JsonKey(name: 'total_livery') final int? totalLivery,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextEditingController? usernameCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextEditingController? countryCodeCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextEditingController? phoneNoCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextEditingController? emailCtr,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final TextEditingController? descriptionCtr,
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
  @JsonKey(name: 'country_code')
  String? get countryCode;
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
  @override
  @JsonKey(name: 'profile_liked')
  bool? get profileLiked;
  @override
  @JsonKey(name: 'total_livery')
  int? get totalLivery; // Username Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get usernameCtr; // Country code Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get countryCodeCtr; // Phone Number Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get phoneNoCtr; // Email Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get emailCtr; // Description Controller
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? get descriptionCtr;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
