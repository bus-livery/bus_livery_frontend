import 'package:flutter/material.dart';

TextStyle normalGreyText(
  BuildContext context, {
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? Theme.of(context).colorScheme.onPrimaryContainer,
    // fontSize: 14,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

TextStyle normalText(BuildContext context) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onPrimaryContainer,
  );
}

InputDecoration tfInputDecoration({
  required BuildContext context,
  String? labelText,
  String? hintText,
  bool isRequired = true,
  Widget? prefixIcon,
  String? suffixIconString,
  Widget? suffixIcon,
  BoxConstraints? prefixIconConstraints,
  BoxConstraints? suffixIconConstraints,
  EdgeInsetsGeometry? contentPadding,
}) {
  return InputDecoration(
    counterText: '',
    fillColor: Theme.of(context).colorScheme.surfaceContainer,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    label:
        labelText != null
            ? RichText(
              text: TextSpan(
                text: labelText,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 18),
                children:
                    isRequired
                        ? [
                          const TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ]
                        : [],
              ),
            )
            : null,
    labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18),
    hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14),
    filled: true,
    hintText: hintText,
    isDense: true,
    errorStyle: TextStyle(fontSize: 0, height: 0),
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        width: 0.8,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red),
    ),
    prefixIcon: prefixIcon,
    prefixIconConstraints: prefixIconConstraints,
    suffixIcon:
        suffixIcon ??
        (suffixIconString != null
            ? Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  suffixIconString,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            )
            : null),
    suffixIconConstraints: suffixIconConstraints,
  );
}
