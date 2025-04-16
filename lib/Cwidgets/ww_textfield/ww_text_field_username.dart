import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_textfield/text_field_base.dart';

class WwTextFieldUsername extends WWTextFieldBase {
  final bool showValidator;
  final BuildContext context;
  final bool showSuffix;

  WwTextFieldUsername({
    super.key,
    required this.context,
    this.showValidator = false,
    super.title,
    super.controller,
    super.hintText,
    this.showSuffix = false,
  }) : super(
         keyboardType: TextInputType.text,
         inputFormatters: [
           FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_-]')),
           LengthLimitingTextInputFormatter(30),
         ],
         suffixIcon: showSuffix ? Icons.info_outline : null,
         suffixTap:
             showSuffix
                 ? () {
                   showDialog(
                     context: context,
                     builder:
                         (context) => AlertDialog(
                           content: WWDialogueBox(
                             text: 'Username Requirements',
                             textSub: '''
• Username must be between 3-30 characters
• Can only contain letters, numbers, underscores (_), and hyphens (-)
• Cannot start or end with a hyphen or underscore
• Cannot contain consecutive hyphens or underscores
• Must be unique and not already taken
''',
                           ),
                         ),
                   );
                 }
                 : null,
         validator: (p0) {
           return showValidator
               ? p0?.isEmpty == true
                   ? ''
                   : null
               : null;
         },
       );
}
