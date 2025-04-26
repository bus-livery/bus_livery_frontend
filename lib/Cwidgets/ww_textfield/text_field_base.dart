import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/styles.dart';

abstract class WWTextFieldBase extends StatelessWidget {
  final String? title;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function()? suffixTap;
  final IconData? suffixIcon;
  final String? hintText;
  final String? labelText;
  final bool description;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const WWTextFieldBase({
    super.key,
    this.title,
    this.onChanged,
    this.controller,
    this.suffixTap,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.description = false,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
    this.autofocus = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) WwText(text: title!, style: normalText()),
        Card(
          margin: EdgeInsets.only(top: 05),
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            autofocus: autofocus,
            keyboardType: keyboardType,

            // cursorColor: Theme.of(context).colorScheme.onPrimaryContainer,
            expands: description,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            inputFormatters: inputFormatters,
            validator: validator,
            maxLength: 50,
            style: textFieldStyle(),
            // style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              counterText: '',

              // filled: true,
              hintText: hintText,
              labelText: labelText,
              border: InputBorder.none,

              // This ensures vertical centering of hint text
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 10,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(fontSize: 0, height: 0),
              // Center hint text vertically
              alignLabelWithHint: true,

              // Properly configure the suffix icon
              suffixIcon:
                  suffixTap == null
                      ? null
                      : GestureDetector(
                        onTap: () => suffixTap?.call(),
                        child: Icon(
                          suffixIcon ?? Icons.search,
                          color: AppColors.primary,
                        ),
                      ),
            ),
          ),
        ),
      ],
    );
  }
}
