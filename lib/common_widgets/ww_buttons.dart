import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_text.dart';

class WWButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double fontSize;
  final IconData? icon; // Add an optional icon parameter

  const WWButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize = 16.0,
    this.icon,
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
          WwText(
            text: text,
            style: TextStyle(fontSize: fontSize),
          ),
          if (icon != null) ...[
            const SizedBox(width: 8), // Add some space between text and icon
            Icon(icon),
          ],
        ],
      ),
    );
  }
}
