import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:livery/main.dart';

// class WWAccountCreation extends StatelessWidget {
//   final bool? isFromPopUp;
//   final BuildContext? context;
//   final Function() onTap;
//   final String errorMessage;
//   const WWAccountCreation({
//     super.key,
//     this.isFromPopUp,
//     this.context,
//     required this.onTap,
//     required this.errorMessage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(AppImages.google),
//         AppSize.sizedBox2h,
//         Text(
//           'Oops',
//           // AppLocalizations.of(context).key_oops,
//           textAlign: TextAlign.center,
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         AppSize.sizedBox1h,
//         Text(
//           errorMessage,
//           textAlign: TextAlign.center,
//           style: Theme.of(context).textTheme.labelSmall,
//         ),
//         AppSize.sizedBox4h,
//         Row(
//           children: [
//             WWButton(
//               expandFlex: 1,
//               text: 'Cancel',
//               onPressed: getIt<AppRouter>().maybePop,
//             ),
//             AppSize.sizedBox2w,
//             WWButton(expandFlex: 1, text: 'Create', onPressed: onTap),
//           ],
//         ),
//       ],
//     );
//   }
// }

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

void showSuccessNotification() {
  BotToast.showCustomNotification(
    duration: const Duration(seconds: 3),
    toastBuilder: (cancelFunc) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            const Text(
              'Success! Your action was successful.',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: cancelFunc,
            ),
          ],
        ),
      );
    },
    animationDuration: const Duration(milliseconds: 300),
    align: Alignment.topRight,
  );
}

void showSuccessToast({String? message}) {
  BotToast.showCustomNotification(
    duration: const Duration(seconds: 3),
    toastBuilder: (cancelFunc) {
      final context = smKey.currentState!.context;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 05.0, horizontal: 24.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary, //Colors.green,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message ?? 'Your action was successful.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: cancelFunc,
            ),
          ],
        ),
      );
    },
    animationDuration: const Duration(milliseconds: 300),
    align: Alignment.bottomCenter, // Usually better for mobile notifications
  );
}

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
