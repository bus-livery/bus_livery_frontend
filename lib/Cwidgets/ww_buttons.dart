import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/main.dart';
import 'package:livery/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

abstract class WWButtonBase extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? buttonColor;
  final bool? loader;
  final bool widthFull; // Makes the button full width if true
  final int expandFlex; // Allows expansion in a flexible layout

  final List<Widget> widgets;

  const WWButtonBase({
    super.key,
    required this.onPressed,
    this.buttonColor,
    required this.widgets,
    this.loader,
    this.expandFlex = 0,
    this.widthFull = false,
  });

  @override
  Widget build(BuildContext context) {
    return expandFlex != 0
        ? Expanded(flex: expandFlex, child: buildButton())
        : buildButton();
  }

  SizedBox buildButton() {
    return SizedBox(
      width: widthFull ? double.infinity : null, // Full width if enabled
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(surfaceTintColor: buttonColor),
        child:
            loader == true
                ? CircularProgressIndicator()
                : widgets.length > 1
                ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgets,
                )
                : widgets.first,
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
    super.widthFull,
    super.expandFlex,
    required super.onPressed,
  }) : super(widgets: [WwText(text: text, style: normalText())]);
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
           WwText(
             text: text,
             style: TextStyle(
               fontSize: fontSize,
               color: Theme.of(smKey.currentState!.context).colorScheme.primary,
             ),
           ),
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
        Theme.of(smKey.currentState!.context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    );
  }
}
