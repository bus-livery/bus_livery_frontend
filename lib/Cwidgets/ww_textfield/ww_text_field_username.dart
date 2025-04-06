import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldUsername extends WWTextFieldBase {
  final bool showValidator;
  WwTextFieldUsername({
    super.key,
    this.showValidator = false,
    super.title,
    super.controller,
    super.hintText,
    super.suffixTap,
  }) : super(
         keyboardType: TextInputType.text,
         inputFormatters: [],
         suffixIcon: Icons.info_outline,
         validator: (p0) {
           return showValidator
               ? p0?.isEmpty == true
                   ? ''
                   : null
               : null;
         },
       );
}
