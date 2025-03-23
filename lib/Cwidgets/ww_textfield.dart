import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_text.dart';
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

            style: textFieldStyle(),
            // style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              // counterText: '',

              // filled: true,
              hintText: hintText,
              labelText: labelText,
              border: InputBorder.none,

              contentPadding: const EdgeInsets.all(10),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(fontSize: 0, height: 0),
              suffixIcon:
                  suffixTap == null
                      ? null
                      : GestureDetector(
                        onTap: () => suffixTap!(),
                        child: Icon(
                          suffixIcon ?? Icons.search,
                          color: Colors.black,
                        ),
                      ),
            ),
          ),
        ),
      ],
    );
  }
}

class WWTextField extends WWTextFieldBase {
  const WWTextField({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
    super.validator,
  });
}

class WWTextFieldEmail extends WWTextFieldBase {
  WWTextFieldEmail({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
  }) : super(
         keyboardType: TextInputType.emailAddress,
         validator: (v) {
           if (v == null || v.isEmpty) {
             return 'Please enter an email address';
           }
           final emailPattern = RegExp(
             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
           );

           if (!emailPattern.hasMatch(v)) {
             return 'Please enter a valid email address';
           }

           return null;
         },
       );
}

class WWTextFieldPhone extends WWTextFieldBase {
  WWTextFieldPhone({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
  }) : super(
         keyboardType: TextInputType.phone,
         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
       );
}

class WWTextFieldTextArea extends WWTextFieldBase {
  const WWTextFieldTextArea({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
  }) : super(keyboardType: TextInputType.multiline, maxLines: 5);
}
