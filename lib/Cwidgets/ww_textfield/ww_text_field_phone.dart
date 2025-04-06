import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldPhone extends WWTextFieldBase {
  final bool showValidator;
  WwTextFieldPhone({
    super.key,
    this.showValidator = false,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
  }) : super(
         keyboardType: TextInputType.phone,
         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
         validator: (p0) {
           return showValidator
               ? p0?.isEmpty == true
                   ? ''
                   : null
               : null;
         },
       );
}
