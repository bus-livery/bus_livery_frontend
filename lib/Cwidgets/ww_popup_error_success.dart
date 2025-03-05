import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/utils/app_images.dart';
import 'package:livery/utils/app_size.dart';
import 'package:svg_flutter/svg.dart';

bool isTestMode = false;

successResponsePop() {
  // return kIsWeb ? showSuccessNotification() : showSuccessNotificationMobile();
}

errorResponsePop(BuildContext context, String errorMessage) {
  if (isTestMode) return;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: WWerrorResponse(
          onTap: () => Navigator.pop(context),
          errorMessage: errorMessage,
          isFromPopUp: true,
          context: context,
        ),
      );
    },
  );
}

class WWerrorResponse extends StatelessWidget {
  final bool? isFromPopUp;
  final BuildContext? context;
  final Function() onTap;
  final String errorMessage;
  const WWerrorResponse({
    super.key,
    this.isFromPopUp,
    this.context,
    required this.onTap,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.google),
        AppSize.sizedBox2h,
        Text(
          'Oops',
          // AppLocalizations.of(context).key_oops,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        AppSize.sizedBox1h,
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        AppSize.sizedBox4h,
        WWButton(
          // width: double.infinity,
          text: 'Dismiss',

          // isFromPopUp == true
          //     ? AppLocalizations.of(context).key_dismiss
          //     : AppLocalizations.of(context).key_try_again,
          onPressed: onTap,
        ),
      ],
    );
  }
}

class ImageConstant {}

// void _showErrorNotification(BuildContext context, String message) {
//   BotToast.showCustomNotification(
//     duration: const Duration(seconds: 3),
//     toastBuilder: (cancelFunc) {
//       return Container(
//         constraints: const BoxConstraints(maxWidth: 500),
//         padding: const EdgeInsets.all(16.0),
//         margin: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: Colors.redAccent,
//           borderRadius: BorderRadius.circular(8.0),
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8.0),
//           ],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.error, color: Colors.white),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Text(message, style: const TextStyle(color: Colors.white)),
//             ),
//             IconButton(
//               icon: const Icon(Icons.close, color: Colors.white),
//               onPressed: cancelFunc,
//             ),
//           ],
//         ),
//       );
//     },
//     animationDuration: const Duration(milliseconds: 300),
//     align: Alignment.topRight,
//   );
// }

// void showSuccessNotification() {
//   BotToast.showCustomNotification(
//     duration: const Duration(seconds: 3),
//     toastBuilder: (cancelFunc) {
//       return Container(
//         padding: const EdgeInsets.all(16.0),
//         margin: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(8.0),
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8.0),
//           ],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.check_circle, color: Colors.white),
//             const SizedBox(width: 10),
//             const Text(
//               'Success! Your action was successful.',
//               style: TextStyle(color: Colors.white),
//             ),
//             IconButton(
//               icon: const Icon(Icons.close, color: Colors.white),
//               onPressed: cancelFunc,
//             ),
//           ],
//         ),
//       );
//     },
//     animationDuration: const Duration(milliseconds: 300),
//     align: Alignment.topRight,
//   );
// }

// void showSuccessNotificationMobile() {
//   BotToast.showCustomNotification(
//     duration: const Duration(seconds: 3),
//     toastBuilder: (cancelFunc) {
//       return Container(
//         padding: const EdgeInsets.symmetric(vertical: 05.0, horizontal: 24.0),
//         margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6.0),
//           ],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.check_circle, color: Colors.white, size: 28),
//             const SizedBox(width: 12),
//             const Expanded(
//               child: Text(
//                 'Your action was successful.',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.close, color: Colors.white),
//               onPressed: cancelFunc,
//             ),
//           ],
//         ),
//       );
//     },
//     animationDuration: const Duration(milliseconds: 300),
//     align: Alignment.bottomCenter, // Usually better for mobile notifications
//   );
// }

// void showCustomNotification(BuildContext context, String message) {
//   if (kIsWeb) {
//     BotToast.showCustomNotification(
//       duration: const Duration(seconds: 3),
//       toastBuilder: (cancelFunc) {
//         return Container(
//           constraints: const BoxConstraints(maxWidth: 500),
//           padding: const EdgeInsets.all(16.0),
//           margin: const EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             color: Theme.of(context).disabledColor,
//             borderRadius: BorderRadius.circular(8.0),
//             boxShadow: [
//               BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8.0),
//             ],
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(Icons.error, color: Colors.white),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   message,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.close, color: Colors.white),
//                 onPressed: cancelFunc,
//               ),
//             ],
//           ),
//         );
//       },
//       animationDuration: const Duration(milliseconds: 300),
//       align: Alignment.topRight,
//     );
//   } else {
//     showSnackBar(context, message, color: Theme.of(context).dividerColor);
//   }
