import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/utils/app_size.dart';

abstract class WWDialogueBoxBase extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? subTitle;
  final TextAlign? textAlign;
  final List<Widget>? buttons;

  const WWDialogueBoxBase({
    super.key,
    this.icon,
    this.title,
    this.subTitle,
    this.buttons,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[icon!, AppSize.sizedBox2h],
        if (title != null) ...[
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          AppSize.sizedBox1h,
        ],
        if (subTitle != null) ...[
          Text(
            subTitle ?? '',
            textAlign: textAlign ?? TextAlign.center,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          AppSize.sizedBox4h,
        ],
        if (buttons != null) Row(children: buttons!),
      ],
    );
  }
}
