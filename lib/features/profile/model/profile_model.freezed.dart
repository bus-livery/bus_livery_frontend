// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

@JsonKey(name: 'ID') int? get id;@JsonKey(name: 'CreatedAt') DateTime? get createdAt;@JsonKey(name: 'UpdatedAt') DateTime? get updatedAt;@JsonKey(name: 'DeletedAt') dynamic get deletedAt; String? get username; String? get dp; String? get phone;@JsonKey(name: 'country_code') String? get countryCode; String? get email; String? get description;@JsonKey(name: 'profile_completed') bool? get profileCompleted;@JsonKey(name: 'active_status') bool? get activeStatus;@JsonKey(name: 'violation_count') int? get violationCount;@JsonKey(name: 'like_count') int? get likeCount;@JsonKey(name: 'profile_liked') bool? get profileLiked;@JsonKey(name: 'total_livery') int? get totalLivery;// Username Controller
@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? get usernameCtr;// Country code Controller
@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? get countryCodeCtr;// Phone Number Controller
@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? get phoneNoCtr;// Email Controller
@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? get emailCtr;// Description Controller
@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? get descriptionCtr;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.username, username) || other.username == username)&&(identical(other.dp, dp) || other.dp == dp)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.description, description) || other.description == description)&&(identical(other.profileCompleted, profileCompleted) || other.profileCompleted == profileCompleted)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.violationCount, violationCount) || other.violationCount == violationCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.profileLiked, profileLiked) || other.profileLiked == profileLiked)&&(identical(other.totalLivery, totalLivery) || other.totalLivery == totalLivery)&&(identical(other.usernameCtr, usernameCtr) || other.usernameCtr == usernameCtr)&&(identical(other.countryCodeCtr, countryCodeCtr) || other.countryCodeCtr == countryCodeCtr)&&(identical(other.phoneNoCtr, phoneNoCtr) || other.phoneNoCtr == phoneNoCtr)&&(identical(other.emailCtr, emailCtr) || other.emailCtr == emailCtr)&&(identical(other.descriptionCtr, descriptionCtr) || other.descriptionCtr == descriptionCtr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),username,dp,phone,countryCode,email,description,profileCompleted,activeStatus,violationCount,likeCount,profileLiked,totalLivery,usernameCtr,countryCodeCtr,phoneNoCtr,emailCtr,descriptionCtr]);

@override
String toString() {
  return 'ProfileModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, username: $username, dp: $dp, phone: $phone, countryCode: $countryCode, email: $email, description: $description, profileCompleted: $profileCompleted, activeStatus: $activeStatus, violationCount: $violationCount, likeCount: $likeCount, profileLiked: $profileLiked, totalLivery: $totalLivery, usernameCtr: $usernameCtr, countryCodeCtr: $countryCodeCtr, phoneNoCtr: $phoneNoCtr, emailCtr: $emailCtr, descriptionCtr: $descriptionCtr)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt, String? username, String? dp, String? phone,@JsonKey(name: 'country_code') String? countryCode, String? email, String? description,@JsonKey(name: 'profile_completed') bool? profileCompleted,@JsonKey(name: 'active_status') bool? activeStatus,@JsonKey(name: 'violation_count') int? violationCount,@JsonKey(name: 'like_count') int? likeCount,@JsonKey(name: 'profile_liked') bool? profileLiked,@JsonKey(name: 'total_livery') int? totalLivery,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? usernameCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? countryCodeCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? phoneNoCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? emailCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? descriptionCtr
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? username = freezed,Object? dp = freezed,Object? phone = freezed,Object? countryCode = freezed,Object? email = freezed,Object? description = freezed,Object? profileCompleted = freezed,Object? activeStatus = freezed,Object? violationCount = freezed,Object? likeCount = freezed,Object? profileLiked = freezed,Object? totalLivery = freezed,Object? usernameCtr = freezed,Object? countryCodeCtr = freezed,Object? phoneNoCtr = freezed,Object? emailCtr = freezed,Object? descriptionCtr = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,dp: freezed == dp ? _self.dp : dp // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,profileCompleted: freezed == profileCompleted ? _self.profileCompleted : profileCompleted // ignore: cast_nullable_to_non_nullable
as bool?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as bool?,violationCount: freezed == violationCount ? _self.violationCount : violationCount // ignore: cast_nullable_to_non_nullable
as int?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,profileLiked: freezed == profileLiked ? _self.profileLiked : profileLiked // ignore: cast_nullable_to_non_nullable
as bool?,totalLivery: freezed == totalLivery ? _self.totalLivery : totalLivery // ignore: cast_nullable_to_non_nullable
as int?,usernameCtr: freezed == usernameCtr ? _self.usernameCtr : usernameCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,countryCodeCtr: freezed == countryCodeCtr ? _self.countryCodeCtr : countryCodeCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,phoneNoCtr: freezed == phoneNoCtr ? _self.phoneNoCtr : phoneNoCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,emailCtr: freezed == emailCtr ? _self.emailCtr : emailCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,descriptionCtr: freezed == descriptionCtr ? _self.descriptionCtr : descriptionCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt,  String? username,  String? dp,  String? phone, @JsonKey(name: 'country_code')  String? countryCode,  String? email,  String? description, @JsonKey(name: 'profile_completed')  bool? profileCompleted, @JsonKey(name: 'active_status')  bool? activeStatus, @JsonKey(name: 'violation_count')  int? violationCount, @JsonKey(name: 'like_count')  int? likeCount, @JsonKey(name: 'profile_liked')  bool? profileLiked, @JsonKey(name: 'total_livery')  int? totalLivery, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? usernameCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? countryCodeCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? phoneNoCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? emailCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? descriptionCtr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.username,_that.dp,_that.phone,_that.countryCode,_that.email,_that.description,_that.profileCompleted,_that.activeStatus,_that.violationCount,_that.likeCount,_that.profileLiked,_that.totalLivery,_that.usernameCtr,_that.countryCodeCtr,_that.phoneNoCtr,_that.emailCtr,_that.descriptionCtr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt,  String? username,  String? dp,  String? phone, @JsonKey(name: 'country_code')  String? countryCode,  String? email,  String? description, @JsonKey(name: 'profile_completed')  bool? profileCompleted, @JsonKey(name: 'active_status')  bool? activeStatus, @JsonKey(name: 'violation_count')  int? violationCount, @JsonKey(name: 'like_count')  int? likeCount, @JsonKey(name: 'profile_liked')  bool? profileLiked, @JsonKey(name: 'total_livery')  int? totalLivery, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? usernameCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? countryCodeCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? phoneNoCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? emailCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? descriptionCtr)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.username,_that.dp,_that.phone,_that.countryCode,_that.email,_that.description,_that.profileCompleted,_that.activeStatus,_that.violationCount,_that.likeCount,_that.profileLiked,_that.totalLivery,_that.usernameCtr,_that.countryCodeCtr,_that.phoneNoCtr,_that.emailCtr,_that.descriptionCtr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ID')  int? id, @JsonKey(name: 'CreatedAt')  DateTime? createdAt, @JsonKey(name: 'UpdatedAt')  DateTime? updatedAt, @JsonKey(name: 'DeletedAt')  dynamic deletedAt,  String? username,  String? dp,  String? phone, @JsonKey(name: 'country_code')  String? countryCode,  String? email,  String? description, @JsonKey(name: 'profile_completed')  bool? profileCompleted, @JsonKey(name: 'active_status')  bool? activeStatus, @JsonKey(name: 'violation_count')  int? violationCount, @JsonKey(name: 'like_count')  int? likeCount, @JsonKey(name: 'profile_liked')  bool? profileLiked, @JsonKey(name: 'total_livery')  int? totalLivery, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? usernameCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? countryCodeCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? phoneNoCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? emailCtr, @JsonKey(includeFromJson: false, includeToJson: false)  TextEditingController? descriptionCtr)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.username,_that.dp,_that.phone,_that.countryCode,_that.email,_that.description,_that.profileCompleted,_that.activeStatus,_that.violationCount,_that.likeCount,_that.profileLiked,_that.totalLivery,_that.usernameCtr,_that.countryCodeCtr,_that.phoneNoCtr,_that.emailCtr,_that.descriptionCtr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
   _ProfileModel({@JsonKey(name: 'ID') this.id, @JsonKey(name: 'CreatedAt') this.createdAt, @JsonKey(name: 'UpdatedAt') this.updatedAt, @JsonKey(name: 'DeletedAt') this.deletedAt, this.username, this.dp, this.phone, @JsonKey(name: 'country_code') this.countryCode, this.email, this.description, @JsonKey(name: 'profile_completed') this.profileCompleted, @JsonKey(name: 'active_status') this.activeStatus, @JsonKey(name: 'violation_count') this.violationCount, @JsonKey(name: 'like_count') this.likeCount, @JsonKey(name: 'profile_liked') this.profileLiked, @JsonKey(name: 'total_livery') this.totalLivery, @JsonKey(includeFromJson: false, includeToJson: false) this.usernameCtr, @JsonKey(includeFromJson: false, includeToJson: false) this.countryCodeCtr, @JsonKey(includeFromJson: false, includeToJson: false) this.phoneNoCtr, @JsonKey(includeFromJson: false, includeToJson: false) this.emailCtr, @JsonKey(includeFromJson: false, includeToJson: false) this.descriptionCtr});
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override@JsonKey(name: 'ID') final  int? id;
@override@JsonKey(name: 'CreatedAt') final  DateTime? createdAt;
@override@JsonKey(name: 'UpdatedAt') final  DateTime? updatedAt;
@override@JsonKey(name: 'DeletedAt') final  dynamic deletedAt;
@override final  String? username;
@override final  String? dp;
@override final  String? phone;
@override@JsonKey(name: 'country_code') final  String? countryCode;
@override final  String? email;
@override final  String? description;
@override@JsonKey(name: 'profile_completed') final  bool? profileCompleted;
@override@JsonKey(name: 'active_status') final  bool? activeStatus;
@override@JsonKey(name: 'violation_count') final  int? violationCount;
@override@JsonKey(name: 'like_count') final  int? likeCount;
@override@JsonKey(name: 'profile_liked') final  bool? profileLiked;
@override@JsonKey(name: 'total_livery') final  int? totalLivery;
// Username Controller
@override@JsonKey(includeFromJson: false, includeToJson: false) final  TextEditingController? usernameCtr;
// Country code Controller
@override@JsonKey(includeFromJson: false, includeToJson: false) final  TextEditingController? countryCodeCtr;
// Phone Number Controller
@override@JsonKey(includeFromJson: false, includeToJson: false) final  TextEditingController? phoneNoCtr;
// Email Controller
@override@JsonKey(includeFromJson: false, includeToJson: false) final  TextEditingController? emailCtr;
// Description Controller
@override@JsonKey(includeFromJson: false, includeToJson: false) final  TextEditingController? descriptionCtr;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.username, username) || other.username == username)&&(identical(other.dp, dp) || other.dp == dp)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.email, email) || other.email == email)&&(identical(other.description, description) || other.description == description)&&(identical(other.profileCompleted, profileCompleted) || other.profileCompleted == profileCompleted)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.violationCount, violationCount) || other.violationCount == violationCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.profileLiked, profileLiked) || other.profileLiked == profileLiked)&&(identical(other.totalLivery, totalLivery) || other.totalLivery == totalLivery)&&(identical(other.usernameCtr, usernameCtr) || other.usernameCtr == usernameCtr)&&(identical(other.countryCodeCtr, countryCodeCtr) || other.countryCodeCtr == countryCodeCtr)&&(identical(other.phoneNoCtr, phoneNoCtr) || other.phoneNoCtr == phoneNoCtr)&&(identical(other.emailCtr, emailCtr) || other.emailCtr == emailCtr)&&(identical(other.descriptionCtr, descriptionCtr) || other.descriptionCtr == descriptionCtr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),username,dp,phone,countryCode,email,description,profileCompleted,activeStatus,violationCount,likeCount,profileLiked,totalLivery,usernameCtr,countryCodeCtr,phoneNoCtr,emailCtr,descriptionCtr]);

@override
String toString() {
  return 'ProfileModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, username: $username, dp: $dp, phone: $phone, countryCode: $countryCode, email: $email, description: $description, profileCompleted: $profileCompleted, activeStatus: $activeStatus, violationCount: $violationCount, likeCount: $likeCount, profileLiked: $profileLiked, totalLivery: $totalLivery, usernameCtr: $usernameCtr, countryCodeCtr: $countryCodeCtr, phoneNoCtr: $phoneNoCtr, emailCtr: $emailCtr, descriptionCtr: $descriptionCtr)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ID') int? id,@JsonKey(name: 'CreatedAt') DateTime? createdAt,@JsonKey(name: 'UpdatedAt') DateTime? updatedAt,@JsonKey(name: 'DeletedAt') dynamic deletedAt, String? username, String? dp, String? phone,@JsonKey(name: 'country_code') String? countryCode, String? email, String? description,@JsonKey(name: 'profile_completed') bool? profileCompleted,@JsonKey(name: 'active_status') bool? activeStatus,@JsonKey(name: 'violation_count') int? violationCount,@JsonKey(name: 'like_count') int? likeCount,@JsonKey(name: 'profile_liked') bool? profileLiked,@JsonKey(name: 'total_livery') int? totalLivery,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? usernameCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? countryCodeCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? phoneNoCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? emailCtr,@JsonKey(includeFromJson: false, includeToJson: false) TextEditingController? descriptionCtr
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? username = freezed,Object? dp = freezed,Object? phone = freezed,Object? countryCode = freezed,Object? email = freezed,Object? description = freezed,Object? profileCompleted = freezed,Object? activeStatus = freezed,Object? violationCount = freezed,Object? likeCount = freezed,Object? profileLiked = freezed,Object? totalLivery = freezed,Object? usernameCtr = freezed,Object? countryCodeCtr = freezed,Object? phoneNoCtr = freezed,Object? emailCtr = freezed,Object? descriptionCtr = freezed,}) {
  return _then(_ProfileModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,dp: freezed == dp ? _self.dp : dp // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,profileCompleted: freezed == profileCompleted ? _self.profileCompleted : profileCompleted // ignore: cast_nullable_to_non_nullable
as bool?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as bool?,violationCount: freezed == violationCount ? _self.violationCount : violationCount // ignore: cast_nullable_to_non_nullable
as int?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,profileLiked: freezed == profileLiked ? _self.profileLiked : profileLiked // ignore: cast_nullable_to_non_nullable
as bool?,totalLivery: freezed == totalLivery ? _self.totalLivery : totalLivery // ignore: cast_nullable_to_non_nullable
as int?,usernameCtr: freezed == usernameCtr ? _self.usernameCtr : usernameCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,countryCodeCtr: freezed == countryCodeCtr ? _self.countryCodeCtr : countryCodeCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,phoneNoCtr: freezed == phoneNoCtr ? _self.phoneNoCtr : phoneNoCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,emailCtr: freezed == emailCtr ? _self.emailCtr : emailCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,descriptionCtr: freezed == descriptionCtr ? _self.descriptionCtr : descriptionCtr // ignore: cast_nullable_to_non_nullable
as TextEditingController?,
  ));
}


}

// dart format on
