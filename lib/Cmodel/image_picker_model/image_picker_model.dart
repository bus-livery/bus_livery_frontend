import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_picker_model.freezed.dart';
part 'image_picker_model.g.dart';

@freezed
class ImagePickerModel with _$ImagePickerModel {
  factory ImagePickerModel({
    String? imageUrl,
    String? fileName,
    String? imagePath,
    String? imageUUID,
    String? imageFileName,
    //
    @JsonKey(includeToJson: false, includeFromJson: false)
    Uint8List? imageUint8List, // Original

    @JsonKey(includeToJson: false, includeFromJson: false)
    Uint8List? imageUint8List1080,

    @JsonKey(includeToJson: false, includeFromJson: false)
    Uint8List? imageUint8List600,

    @JsonKey(includeToJson: false, includeFromJson: false)
    Uint8List? imageUint8List200,
  }) = _ImagePickerModel;

  factory ImagePickerModel.fromJson(Map<String, dynamic> json) =>
      _$ImagePickerModelFromJson(json);
}
