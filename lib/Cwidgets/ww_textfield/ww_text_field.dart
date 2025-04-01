import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

export 'package:livery/Cwidgets/ww_textfield/ww_text_field_area.dart';
export 'package:livery/Cwidgets/ww_textfield/ww_text_field_email.dart';
export 'package:livery/Cwidgets/ww_textfield/ww_text_field_phone.dart';

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
