import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:livery/utils/country_phone_util.dart';

class WwCountryCode extends StatelessWidget {
  final Function(CountryCode countryCode, int maxLength) onChanged;
  final String initialSelection;
  final List<String> favorite;

  const WwCountryCode({
    super.key,
    required this.onChanged,
    this.initialSelection = 'IN',
    this.favorite = const ['+91', 'IN'],
  });

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: (CountryCode countryCode) {
        // Get the max length for this country and pass it along with the country code
        final maxLength = CountryPhoneUtil.getMaxPhoneLength(countryCode);
        onChanged(countryCode, maxLength);
      },
      initialSelection: initialSelection,
      favorite: favorite,
      dialogBackgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
    );
  }
}
