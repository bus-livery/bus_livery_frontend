import 'package:flutter/material.dart';

class WWTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Function()? suffixTap;
  final IconData? suffixIcon;
  final String? hintText;
  final String? labelText;

  final bool description;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool obscureText;
  final bool autofocus;
  const WWTextField(
      {super.key,
      this.onChanged,
      required this.controller,
      this.suffixTap,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.description = false,
      this.keyboardType = TextInputType.name,
      this.obscureText = false,
      this.maxLines,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextField(
          onChanged: onChanged,
          controller: controller,
          autofocus: autofocus,
          keyboardType: keyboardType,
          expands: description,
          obscureText: obscureText,
          maxLines: maxLines,

          // style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            // filled: true,
            hintText: hintText,
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            suffixIcon: suffixTap == null
                ? null
                : GestureDetector(
                    onTap: () => suffixTap!(),
                    child: Icon(
                      suffixIcon ?? Icons.search,
                      color: Colors.black,
                    )),
          )),
    );
  }
}
