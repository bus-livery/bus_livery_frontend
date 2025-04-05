import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldUsername extends WWTextFieldBase {
  WwTextFieldUsername({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.suffixTap,
  }) : super(
         keyboardType: TextInputType.text,
         inputFormatters: [],
         suffixIcon: Icons.info_outline,
       );
}
