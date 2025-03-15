import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:livery/Cmodel/image_picker_model/image_picker_model.dart';

// class ImagePickerService {
//   //
//   static Future<ImagePickerModel?> imagePicker({
//     ImageSource source = ImageSource.gallery,
//   }) async {
//     XFile? imageFile = await ImagePicker().pickImage(
//       source: source,
//       imageQuality: 50,
//       maxHeight: 1080,
//       maxWidth: 1080,
//     );

//     var imageBytes = await imageFile?.readAsBytes();

//     return imageFile != null
//         ? ImagePickerModel(
//           imageUint8List: imageBytes,
//           imagePath: imageFile.path,
//           imageFileName: imageFile.name,
//         )
//         : null;
//   }
// }

class ImagePickerService {
  static Future<ImagePickerModel?> imagePicker({
    ImageSource source = ImageSource.gallery,
  }) async {
    XFile? imageFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100, // Keep the original quality
    );

    if (imageFile == null) return null;

    Uint8List imageBytes = await imageFile.readAsBytes();

    // Convert Uint8List to Image for resizing
    img.Image? originalImage = img.decodeImage(imageBytes);
    if (originalImage == null) return null;

    // Resize images to different resolutions
    Uint8List resized1080 = _resizeImage(originalImage, 1080);
    Uint8List resized600 = _resizeImage(originalImage, 600);
    Uint8List resized200 = _resizeImage(originalImage, 200);

    return ImagePickerModel(
      imageUint8List: imageBytes, // Original image
      imageUint8List1080: resized1080,
      imageUint8List600: resized600,
      imageUint8List200: resized200,
      imagePath: imageFile.path,
      imageFileName: imageFile.name,
    );
  }

  /// Helper function to resize an image
  static Uint8List _resizeImage(img.Image image, int size) {
    img.Image resized = img.copyResize(image, width: size);
    return Uint8List.fromList(img.encodeJpg(resized));
  }
}
