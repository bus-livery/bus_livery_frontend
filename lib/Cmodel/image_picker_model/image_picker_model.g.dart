// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_picker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImagePickerModel _$ImagePickerModelFromJson(Map<String, dynamic> json) =>
    _ImagePickerModel(
      imageUrl: json['imageUrl'] as String?,
      fileName: json['fileName'] as String?,
      imagePath: json['imagePath'] as String?,
      imageUUID: json['imageUUID'] as String?,
      imageFileName: json['imageFileName'] as String?,
    );

Map<String, dynamic> _$ImagePickerModelToJson(_ImagePickerModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'fileName': instance.fileName,
      'imagePath': instance.imagePath,
      'imageUUID': instance.imageUUID,
      'imageFileName': instance.imageFileName,
    };
