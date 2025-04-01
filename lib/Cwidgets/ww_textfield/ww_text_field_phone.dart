import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

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
