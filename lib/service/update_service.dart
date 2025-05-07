import 'package:in_app_update/in_app_update.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/custom_print.dart';

@lazySingleton
class UpdateService {
  // Check for updates and show update dialog if available
  // Future<void> checkForUpdates() async {
  //   try {
  //     final updateInfo = await InAppUpdate.checkForUpdate();

  //     if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
  //       if (updateInfo.immediateUpdateAllowed) {
  //         // For high priority updates, show immediate update dialog
  //         await InAppUpdate.performImmediateUpdate();
  //       } else if (updateInfo.flexibleUpdateAllowed) {
  //         // For normal priority updates, show flexible update dialog
  //         await InAppUpdate.startFlexibleUpdate();
  //         // After flexible update is downloaded, complete the update
  //         await InAppUpdate.completeFlexibleUpdate();
  //       }
  //     }
  //   } catch (e) {
  //     customPrint('Error checking for updates: $e');
  //   }
  // }

  // Check for updates in the background
  Future<void> checkForUpdatesInBackground() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      customPrint('updateInfo: $updateInfo');
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        customPrint(
          'updateInfo.updateAvailability: ${updateInfo.updateAvailability}',
        );
        if (updateInfo.immediateUpdateAllowed) {
          // Start immediate update in background
          await InAppUpdate.performImmediateUpdate();
        } else if (updateInfo.flexibleUpdateAllowed) {
          // Start flexible update in background
          await InAppUpdate.startFlexibleUpdate();
          // After flexible update is downloaded, complete the update
          await InAppUpdate.completeFlexibleUpdate();
        }
      }
    } catch (e) {
      customPrint('Error checking for updates in background: $e');
    }
  }

  // Get update info without showing dialog
  Future<AppUpdateInfo?> getUpdateInfo() async {
    try {
      return await InAppUpdate.checkForUpdate();
    } catch (e) {
      customPrint('Error getting update info: $e');
      return null;
    }
  }
}
