import 'package:flutter/material.dart';

class WwText extends StatelessWidget {
  final BuildContext? context;
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextStyle? test;
  final int? maxLines;
  final TextOverflow? overflow;

  const WwText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.test,
    this.context,
  });

  @override
  Widget build(BuildContext context) {
    var s = Theme.of(context).textTheme.displayLarge!;
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

// TextStyle textStyle(BuildContext context, TextStyles styles) => switch (styles) {
//       TextStyles.heading => Theme.of(context).textTheme.displayLarge!,
//       TextStyles.subheading => Theme.of(context).textTheme.displayLarge!,
//       TextStyles.body => Theme.of(context).textTheme.displayLarge!,
//       _ => Theme.of(context).textTheme.displayLarge!,
//     };

// enum TextStyles { heading, subheading, body }

class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  TextStyle get heading1 {
    return Theme.of(context).textTheme.displayLarge!;
  }

  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
