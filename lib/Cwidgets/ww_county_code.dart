import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class WwCountryCode extends StatelessWidget {
  final Function(CountryCode v) onChanged;
  const WwCountryCode({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      initialSelection: 'IN',
      favorite: ['+91', 'IN'],
      dialogBackgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
    );
  }
}
