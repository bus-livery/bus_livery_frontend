import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadAndSaveImageWithDio(
  LiveryBloc bloc,
  LiveryModel data,
) async {
  try {
    bloc.add(DownloadLiveryApiEvent(liveryId: data.id));

    final imageUrl = data.postImage?.liveryImageOriginal;

    if (imageUrl == null || imageUrl.isEmpty) {
      throw Exception("Image URL is empty");
    }

    final status = await Permission.photos.request(); // For Android 13+
    final storageStatus = await Permission.storage.request();

    if (!status.isGranted && !storageStatus.isGranted) {
      throw Exception("Permission denied");
    }

    final response = await Dio().get<List<int>>(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data!),
      quality: 100,
      name: "livery_${DateTime.now().millisecondsSinceEpoch}",
    );

    if (result['isSuccess']) {
      showSuccessToast(message: 'File downloaded to gallery');
      customPrint("Saved to gallery: ${result['filePath']}");
    } else {
      throw Exception("Failed to save image");
    }
  } catch (e) {
    customPrint("Error downloading or saving file: $e");
  }
}
