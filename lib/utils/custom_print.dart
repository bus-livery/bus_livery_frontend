import 'package:flutter/material.dart';

void customPrint(dynamic content, {String? name}) {
  if (name != null) {
    debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = =");
    debugPrint(name);
  }
  debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = =");
  debugPrint("$content");
  debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = =");
}
