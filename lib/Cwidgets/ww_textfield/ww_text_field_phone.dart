import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldPhone extends WWTextFieldBase {
  final bool showValidator;
  final int? phoneMaxLength;

  WwTextFieldPhone({
    super.key,
    this.showValidator = false,
    this.phoneMaxLength,
    super.title,
    super.controller,
    super.hintText,
    super.onChanged,
  }) : super(
         keyboardType: TextInputType.phone,
         inputFormatters: [
           FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
           if (phoneMaxLength != null)
             LengthLimitingTextInputFormatter(phoneMaxLength),
         ],
         validator: (p0) {
           if (!showValidator) return null;

           if (p0?.isEmpty == true) return '';

           if (phoneMaxLength != null && p0!.length != phoneMaxLength) {
             return 'Phone number must be $phoneMaxLength digits';
           }

           return null;
         },
       );
}
