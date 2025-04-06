import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldPassword extends WWTextFieldBase {
  final bool showValidator;
  WwTextFieldPassword({
    super.key,
    this.showValidator = false,
    super.title,
    super.controller,
    super.hintText,
    super.suffixTap,
    super.suffixIcon,
    super.obscureText,
  }) : super(
         keyboardType: TextInputType.text,
         maxLines: 1, // mandatory field
         validator: (p0) {
           return showValidator
               ? p0?.isEmpty == true
                   ? ''
                   : null
               : null;
         },
       );
}
