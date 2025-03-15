import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_service.freezed.dart';
part 'image_picker_service.g.dart';

@freezed
class ImagePickerModel with _$ImagePickerModel {
  factory ImagePickerModel({
    String? imageUrl,
    String? fileName,
    String? imagePath,
    String? imageUUID,
    String? imageFileName,
    @JsonKey(includeToJson: false, includeFromJson: false)
    Uint8List? imageUint8List,
  }) = _ImagePickerModel;

  factory ImagePickerModel.fromJson(Map<String, dynamic> json) =>
      _$ImagePickerModelFromJson(json);
}

// class ImagePickerModel {
//   String? imageUrl;
//   String? fileName;
//   String? imagePath;
//   String? imageUUID;
//   String? imageFileName;
//   Uint8List? imageUint8List;

//   bool? primary;

//   ImagePickerModel({
//     this.primary,
//     this.fileName,
//     this.imageUrl,
//     this.imagePath,
//     this.imageUUID,
//     this.imageFileName,
//     this.imageUint8List,
//   });
// }

class ImagePickerService {
  //
  static Future<ImagePickerModel?> imagePicker({
    ImageSource source = ImageSource.gallery,
  }) async {
    XFile? imageFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
      maxHeight: 1080,
      maxWidth: 1080,
    );

    var imageBytes = await imageFile?.readAsBytes();

    return imageFile != null
        ? ImagePickerModel(
          imageUint8List: imageBytes,
          imagePath: imageFile.path,
          imageFileName: imageFile.name,
        )
        : null;
  }
}
