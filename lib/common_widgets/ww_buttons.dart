import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_text.dart';

class WWButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double fontSize;
  final Widget? suffixIcon;
  final Widget? preffixIcon;

  const WWButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize = 16.0,
    this.suffixIcon,
    this.preffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(surfaceTintColor: color),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (preffixIcon != null) ...[
            preffixIcon!,
            const SizedBox(width: 8), // Add some space between text and icon
          ],
          WwText(
            text: text,
            style: TextStyle(fontSize: fontSize),
          ),
          if (suffixIcon != null) ...[
            const SizedBox(width: 8), // Add some space between text and icon
            suffixIcon!,
          ],
        ],
      ),
    );
  }
}
