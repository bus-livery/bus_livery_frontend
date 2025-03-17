import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String displayDDMMYY() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}
