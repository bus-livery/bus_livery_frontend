import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
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

abstract class ImagePickerService {
  Future<ImagePickerModel?> imagePicker({
    ImageSource source = ImageSource.gallery,
  });
}

@LazySingleton(as: ImagePickerService)
class ImagePickerServiceImpl extends ImagePickerService {
  @override
  Future<ImagePickerModel?> imagePicker({
    ImageSource source = ImageSource.gallery,
  }) async {
    XFile? imageFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 90, // Slightly reduce initial quality to speed up loading
    );

    if (imageFile == null) return null;

    // Read the file bytes - this operation is I/O bound and doesn't need an isolate
    Uint8List originalBytes = await imageFile.readAsBytes();

    // Process the image in a separate isolate
    final processedImages = await compute(_processImage, originalBytes);

    if (processedImages == null) return null;

    return ImagePickerModel(
      imageUint8List: originalBytes, // Original image
      imageUint8List1080: processedImages[0],
      imageUint8List600: processedImages[1],
      imageUint8List200: processedImages[2],
      imagePath: imageFile.path,
      imageFileName: imageFile.name,
    );
  }

  /// Process image in isolate - this function will run in a separate isolate
  static List<Uint8List>? _processImage(Uint8List bytes) {
    // Decode the image
    img.Image? originalImage = img.decodeImage(bytes);
    if (originalImage == null) return null;

    // Resize to different sizes
    final resized1080 = _resizeImage(originalImage, 1080);
    final resized600 = _resizeImage(originalImage, 600);
    final resized200 = _resizeImage(originalImage, 200);

    return [resized1080, resized600, resized200];
  }

  /// Helper function to resize an image
  static Uint8List _resizeImage(img.Image image, int size) {
    // Preserve aspect ratio
    int? width, height;
    if (image.width > image.height) {
      width = size;
      height = (size * image.height / image.width).round();
    } else {
      height = size;
      width = (size * image.width / image.height).round();
    }

    // Resize the image
    img.Image resized = img.copyResize(
      image,
      width: width,
      height: height,
      interpolation: img.Interpolation.average, // Better quality resizing
    );

    // Encode the image with slightly better quality for the larger sizes
    int quality = size >= 1000 ? 85 : (size >= 500 ? 80 : 75);
    return Uint8List.fromList(img.encodeJpg(resized, quality: quality));
  }
}
