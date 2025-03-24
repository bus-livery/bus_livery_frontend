import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box_base.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class WWDialogueBoxError extends WWDialogueBoxBase {
  final String? text;
  final String? textSub;
  final String? svgIcon;
  final Function() onTap;
  WWDialogueBoxError({
    super.key,
    this.svgIcon,
    this.text,
    this.textSub,
    required this.onTap,
  }) : super(
         icon: SvgPicture.asset(svgIcon ?? AppImages.alertWarning),
         title: text ?? 'Oops',
         subTitle: textSub,
         buttons: [
           WWButton(expandFlex: 1, text: 'Try Again', onPressed: onTap),
         ],
       );
}
