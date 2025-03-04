import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/main.dart';
import 'package:svg_flutter/svg.dart';

abstract class WWButtonBase extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? buttonColor;
  final bool? loader;

  final List<Widget> widgets;

  const WWButtonBase({
    super.key,
    required this.onPressed,
    this.buttonColor,
    required this.widgets,
    this.loader,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(surfaceTintColor: buttonColor),
      child:
          loader == true
              ? CircularProgressIndicator()
              : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: widgets,
              ),
    );
  }
}

class WWButton extends WWButtonBase {
  final String text;
  final double? fontSize;
  WWButton({
    required this.text,
    this.fontSize,
    super.key,
    super.loader,
    required super.onPressed,
  }) : super(
         widgets: [
           WwText(
             text: text,
             style: TextStyle(
               fontSize: fontSize,
               color:
                   Theme.of(
                     scaffoldMessengerKey.currentState!.context,
                   ).colorScheme.primary,
             ),
           ),
         ],
       );
}

class WWButtonPrefixSvg extends WWButtonBase {
  final String text;
  final double? fontSize;
  final String icon;
  WWButtonPrefixSvg({
    super.key,
    required this.text,
    required this.icon,
    this.fontSize,
    super.loader,
    required super.onPressed,
  }) : super(
         widgets: [
           _ButtonSvg(icon: icon),
           const SizedBox(width: 8),
           WwText(text: text, style: TextStyle(fontSize: fontSize)),
         ],
       );
}

class WWButtonSuffixSvg extends WWButtonBase {
  final String text;
  final double? fontSize;
  final String icon;
  WWButtonSuffixSvg({
    super.key,
    required this.text,
    required this.icon,
    this.fontSize,
    super.loader,
    required super.onPressed,
  }) : super(
         widgets: [
           WwText(text: text, style: TextStyle(fontSize: fontSize)),
           const SizedBox(width: 8),
           _ButtonSvg(icon: icon),
         ],
       );
}

class _ButtonSvg extends StatelessWidget {
  final String icon;
  const _ButtonSvg({required this.icon});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        Theme.of(
          scaffoldMessengerKey.currentState!.context,
        ).colorScheme.primary,
        BlendMode.srcIn,
      ),
    );
  }
}
