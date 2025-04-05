import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldPassword extends WWTextFieldBase {
  const WwTextFieldPassword({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.suffixTap,
    super.suffixIcon,
    super.obscureText,
  }) : super(
         keyboardType: TextInputType.text,
         maxLines: 1, // mandatory field
       );
}
