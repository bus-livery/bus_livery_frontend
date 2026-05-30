// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_picker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImagePickerModel {

 String? get imageUrl; String? get fileName; String? get imagePath; String? get imageUUID; String? get imageFileName;//
@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? get imageUint8List;// Original
@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? get imageUint8List1080;@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? get imageUint8List600;@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? get imageUint8List200;
/// Create a copy of ImagePickerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImagePickerModelCopyWith<ImagePickerModel> get copyWith => _$ImagePickerModelCopyWithImpl<ImagePickerModel>(this as ImagePickerModel, _$identity);

  /// Serializes this ImagePickerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagePickerModel&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.imageUUID, imageUUID) || other.imageUUID == imageUUID)&&(identical(other.imageFileName, imageFileName) || other.imageFileName == imageFileName)&&const DeepCollectionEquality().equals(other.imageUint8List, imageUint8List)&&const DeepCollectionEquality().equals(other.imageUint8List1080, imageUint8List1080)&&const DeepCollectionEquality().equals(other.imageUint8List600, imageUint8List600)&&const DeepCollectionEquality().equals(other.imageUint8List200, imageUint8List200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,fileName,imagePath,imageUUID,imageFileName,const DeepCollectionEquality().hash(imageUint8List),const DeepCollectionEquality().hash(imageUint8List1080),const DeepCollectionEquality().hash(imageUint8List600),const DeepCollectionEquality().hash(imageUint8List200));

@override
String toString() {
  return 'ImagePickerModel(imageUrl: $imageUrl, fileName: $fileName, imagePath: $imagePath, imageUUID: $imageUUID, imageFileName: $imageFileName, imageUint8List: $imageUint8List, imageUint8List1080: $imageUint8List1080, imageUint8List600: $imageUint8List600, imageUint8List200: $imageUint8List200)';
}


}

/// @nodoc
abstract mixin class $ImagePickerModelCopyWith<$Res>  {
  factory $ImagePickerModelCopyWith(ImagePickerModel value, $Res Function(ImagePickerModel) _then) = _$ImagePickerModelCopyWithImpl;
@useResult
$Res call({
 String? imageUrl, String? fileName, String? imagePath, String? imageUUID, String? imageFileName,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List1080,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List600,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List200
});




}
/// @nodoc
class _$ImagePickerModelCopyWithImpl<$Res>
    implements $ImagePickerModelCopyWith<$Res> {
  _$ImagePickerModelCopyWithImpl(this._self, this._then);

  final ImagePickerModel _self;
  final $Res Function(ImagePickerModel) _then;

/// Create a copy of ImagePickerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = freezed,Object? fileName = freezed,Object? imagePath = freezed,Object? imageUUID = freezed,Object? imageFileName = freezed,Object? imageUint8List = freezed,Object? imageUint8List1080 = freezed,Object? imageUint8List600 = freezed,Object? imageUint8List200 = freezed,}) {
  return _then(_self.copyWith(
imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,imageUUID: freezed == imageUUID ? _self.imageUUID : imageUUID // ignore: cast_nullable_to_non_nullable
as String?,imageFileName: freezed == imageFileName ? _self.imageFileName : imageFileName // ignore: cast_nullable_to_non_nullable
as String?,imageUint8List: freezed == imageUint8List ? _self.imageUint8List : imageUint8List // ignore: cast_nullable_to_non_nullable
as Uint8List?,imageUint8List1080: freezed == imageUint8List1080 ? _self.imageUint8List1080 : imageUint8List1080 // ignore: cast_nullable_to_non_nullable
as Uint8List?,imageUint8List600: freezed == imageUint8List600 ? _self.imageUint8List600 : imageUint8List600 // ignore: cast_nullable_to_non_nullable
as Uint8List?,imageUint8List200: freezed == imageUint8List200 ? _self.imageUint8List200 : imageUint8List200 // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImagePickerModel].
extension ImagePickerModelPatterns on ImagePickerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImagePickerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImagePickerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImagePickerModel value)  $default,){
final _that = this;
switch (_that) {
case _ImagePickerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImagePickerModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImagePickerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? imageUrl,  String? fileName,  String? imagePath,  String? imageUUID,  String? imageFileName, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List1080, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List600, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List200)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImagePickerModel() when $default != null:
return $default(_that.imageUrl,_that.fileName,_that.imagePath,_that.imageUUID,_that.imageFileName,_that.imageUint8List,_that.imageUint8List1080,_that.imageUint8List600,_that.imageUint8List200);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? imageUrl,  String? fileName,  String? imagePath,  String? imageUUID,  String? imageFileName, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List1080, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List600, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List200)  $default,) {final _that = this;
switch (_that) {
case _ImagePickerModel():
return $default(_that.imageUrl,_that.fileName,_that.imagePath,_that.imageUUID,_that.imageFileName,_that.imageUint8List,_that.imageUint8List1080,_that.imageUint8List600,_that.imageUint8List200);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? imageUrl,  String? fileName,  String? imagePath,  String? imageUUID,  String? imageFileName, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List1080, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List600, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? imageUint8List200)?  $default,) {final _that = this;
switch (_that) {
case _ImagePickerModel() when $default != null:
return $default(_that.imageUrl,_that.fileName,_that.imagePath,_that.imageUUID,_that.imageFileName,_that.imageUint8List,_that.imageUint8List1080,_that.imageUint8List600,_that.imageUint8List200);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImagePickerModel implements ImagePickerModel {
   _ImagePickerModel({this.imageUrl, this.fileName, this.imagePath, this.imageUUID, this.imageFileName, @JsonKey(includeToJson: false, includeFromJson: false) this.imageUint8List, @JsonKey(includeToJson: false, includeFromJson: false) this.imageUint8List1080, @JsonKey(includeToJson: false, includeFromJson: false) this.imageUint8List600, @JsonKey(includeToJson: false, includeFromJson: false) this.imageUint8List200});
  factory _ImagePickerModel.fromJson(Map<String, dynamic> json) => _$ImagePickerModelFromJson(json);

@override final  String? imageUrl;
@override final  String? fileName;
@override final  String? imagePath;
@override final  String? imageUUID;
@override final  String? imageFileName;
//
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Uint8List? imageUint8List;
// Original
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Uint8List? imageUint8List1080;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Uint8List? imageUint8List600;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Uint8List? imageUint8List200;

/// Create a copy of ImagePickerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImagePickerModelCopyWith<_ImagePickerModel> get copyWith => __$ImagePickerModelCopyWithImpl<_ImagePickerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImagePickerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImagePickerModel&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.imageUUID, imageUUID) || other.imageUUID == imageUUID)&&(identical(other.imageFileName, imageFileName) || other.imageFileName == imageFileName)&&const DeepCollectionEquality().equals(other.imageUint8List, imageUint8List)&&const DeepCollectionEquality().equals(other.imageUint8List1080, imageUint8List1080)&&const DeepCollectionEquality().equals(other.imageUint8List600, imageUint8List600)&&const DeepCollectionEquality().equals(other.imageUint8List200, imageUint8List200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,fileName,imagePath,imageUUID,imageFileName,const DeepCollectionEquality().hash(imageUint8List),const DeepCollectionEquality().hash(imageUint8List1080),const DeepCollectionEquality().hash(imageUint8List600),const DeepCollectionEquality().hash(imageUint8List200));

@override
String toString() {
  return 'ImagePickerModel(imageUrl: $imageUrl, fileName: $fileName, imagePath: $imagePath, imageUUID: $imageUUID, imageFileName: $imageFileName, imageUint8List: $imageUint8List, imageUint8List1080: $imageUint8List1080, imageUint8List600: $imageUint8List600, imageUint8List200: $imageUint8List200)';
}


}

/// @nodoc
abstract mixin class _$ImagePickerModelCopyWith<$Res> implements $ImagePickerModelCopyWith<$Res> {
  factory _$ImagePickerModelCopyWith(_ImagePickerModel value, $Res Function(_ImagePickerModel) _then) = __$ImagePickerModelCopyWithImpl;
@override @useResult
$Res call({
 String? imageUrl, String? fileName, String? imagePath, String? imageUUID, String? imageFileName,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List1080,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List600,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? imageUint8List200
});




}
/// @nodoc
class __$ImagePickerModelCopyWithImpl<$Res>
    implements _$ImagePickerModelCopyWith<$Res> {
  __$ImagePickerModelCopyWithImpl(this._self, this._then);

  final _ImagePickerModel _self;
  final $Res Function(_ImagePickerModel) _then;

/// Create a copy of ImagePickerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = freezed,Object? fileName = freezed,Object? imagePath = freezed,Object? imageUUID = freezed,Object? imageFileName = freezed,Object? imageUint8List = freezed,Object? imageUint8List1080 = freezed,Object? imageUint8List600 = freezed,Object? imageUint8List200 = freezed,}) {
  return _then(_ImagePickerModel(
imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,imageUUID: freezed == imageUUID ? _self.imageUUID : imageUUID // ignore: cast_nullable_to_non_nullable
as String?,imageFileName: freezed == imageFileName ? _self.imageFileName : imageFileName // ignore: cast_nullable_to_non_nullable
as String?,imageUint8List: freezed == imageUint8List ? _self.imageUint8List : imageUint8List // ignore: cast_nullable_to_non_nullable
as Uint8List?,imageUint8List1080: freezed == imageUint8List1080 ? _self.imageUint8List1080 : imageUint8List1080 // ignore: cast_nullable_to_non_nullable
as Uint8List?,imageUint8List600: freezed == imageUint8List600 ? _self.imageUint8List600 : imageUint8List600 // ignore: cast_nullable_to_non_nullable
as Uint8List?,imageUint8List200: freezed == imageUint8List200 ? _self.imageUint8List200 : imageUint8List200 // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
