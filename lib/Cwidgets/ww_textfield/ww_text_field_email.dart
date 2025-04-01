import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

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
