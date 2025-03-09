import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class WWPinCodeTextField extends StatelessWidget {
  WWPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  });

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 6,
        keyboardType: TextInputType.number,
        textStyle: textStyle,
        hintStyle: hintStyle,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 50.h,
          fieldWidth: 47.w,
          shape: PinCodeFieldShape.box,
          inActiveBoxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              offset: const Offset(2, 2),
              spreadRadius: 0.1,
              blurRadius: 1,
            ),
          ],
          activeBoxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              offset: const Offset(2, 2),
              spreadRadius: 0.1,
              blurRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          inactiveFillColor: Theme.of(context).colorScheme.primaryContainer,
          activeFillColor: Theme.of(context).colorScheme.primaryContainer,
          selectedFillColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
