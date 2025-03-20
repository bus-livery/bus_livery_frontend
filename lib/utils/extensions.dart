import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String displayDDMMYY() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}

extension BlocExtensions on Bloc {
  void addIf(bool? condition, event) {
    if (condition ?? false) {
      add(event);
    }
  }
}
