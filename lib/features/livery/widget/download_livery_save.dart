import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:livery/main_screen.dart';
import 'package:livery/utils/toast.dart';

Future<void> downloadAndSaveImageWithDio(
  LiveryBloc bloc,
  LiveryModel data,
) async {
  try {
    final apiResponse = await bloc.liverService.downloadCountServiceApi(
      data.id,
    );

    bool isSuccess = false;
    String? errorMsg;
    int? newDownloadCount;

    apiResponse.fold(
      (failure) {
        isSuccess = false;
        errorMsg = failure;
      },
      (success) {
        isSuccess = true;
        newDownloadCount = success.downloadCount;
      },
    );

    if (!isSuccess) {
      failureToast(errorMsg ?? "Failed to initiate download");
      if (errorMsg == "Insufficient points") {
        MainScreenState.activeState?.setSelectedIndex(2);
      }
      return;
    }

    if (newDownloadCount != null && data.id != null) {
      bloc.add(
        UpdateLiveryDownloadCountEvent(
          liveryId: data.id!,
          downloadCount: newDownloadCount!,
        ),
      );
    }

    final imageUrl = data.postImage?.liveryImageOriginal;

    if (imageUrl == null || imageUrl.isEmpty) {
      throw Exception("Image URL is empty");
    }

    bool hasPermission = true;
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt < 29) {
        final storageStatus = await Permission.storage.request();
        hasPermission = storageStatus.isGranted;
      } else {
        hasPermission = true;
      }
    } else if (Platform.isIOS) {
      final status = await Permission.photos.request();
      hasPermission = status.isGranted;
    }

    if (!hasPermission) {
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
