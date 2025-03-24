import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box_base.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/utils/app_images.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/router/router.dart';
import 'package:svg_flutter/svg.dart';

wwDialogueBox(
  BuildContext context, {
  final String? text,
  final String? textSub,
  final String? svgIcon,
  final bool barrierDismissible = true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        content: WWDialogueBox(svgIcon: svgIcon, text: text, textSub: textSub),
      );
    },
  );
}

class WWDialogueBox extends WWDialogueBoxBase {
  final String? text;
  final String? textSub;
  final String? svgIcon;
  WWDialogueBox({super.key, this.svgIcon, this.text, this.textSub})
    : super(
        icon: SvgPicture.asset(svgIcon ?? AppImages.alertWarning),
        title: text ?? 'Oops',
        subTitle: textSub,
        buttons: [
          WWButton(
            expandFlex: 1,
            text: 'Dismiss',
            onPressed: getIt<AppRouter>().maybePop,
          ),
        ],
      );
}
