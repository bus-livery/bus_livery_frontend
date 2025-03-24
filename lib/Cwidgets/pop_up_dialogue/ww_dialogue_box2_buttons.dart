import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box_base.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/utils/app_images.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/router/router.dart';
import 'package:svg_flutter/svg.dart';

wwDialogueBox2Button(
  BuildContext context, {
  String? text,
  String? textSub,
  String? svgIcon,
  Function? firstTap,
  required Function() secondTap,
  String? buttonName,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: WWDialogueBox2Button(
          firstTap: firstTap,
          secondTap: secondTap,
          buttonName: buttonName,
          svgIcon: svgIcon,
          text: text,
          textSub: textSub,
        ),
      );
    },
  );
}

class WWDialogueBox2Button extends WWDialogueBoxBase {
  final String? text;
  final String? textSub;
  final String? svgIcon;
  final Function? firstTap;
  final Function() secondTap;
  final String? buttonName;
  WWDialogueBox2Button({
    super.key,
    this.text,
    this.textSub,
    this.svgIcon,
    this.buttonName,
    required this.secondTap,
    this.firstTap,
  }) : super(
         icon: SvgPicture.asset(svgIcon ?? AppImages.alertWarning),
         title: text ?? 'Oops',
         subTitle: textSub,
         buttons: [
           WWButton(
             expandFlex: 1,
             text: 'Close',
             onPressed: () {
               firstTap != null ? firstTap() : getIt<AppRouter>().maybePop();
             },
           ),
           AppSize.sizedBox2w,
           WWButton(
             expandFlex: 1,
             text: buttonName ?? 'Continue',
             onPressed: secondTap,
           ),
         ],
       );
}
