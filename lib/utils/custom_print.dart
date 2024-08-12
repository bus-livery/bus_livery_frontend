import 'package:flutter/material.dart';

void customPrint({String? name, required dynamic content}) {
  if (name != null) {
    debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = =");
    debugPrint(name);
  }
  debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = =");
  debugPrint("$content");
  debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = =");
}
