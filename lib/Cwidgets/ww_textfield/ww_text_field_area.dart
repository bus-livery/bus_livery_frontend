import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WWTextFieldTextArea extends WWTextFieldBase {
  const WWTextFieldTextArea({
    super.key,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
  }) : super(keyboardType: TextInputType.multiline, maxLines: 5);
}
