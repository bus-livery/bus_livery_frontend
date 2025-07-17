import 'dart:developer';

void customPrint(dynamic content, {String? name}) {
  if (name != null) {
    log("= = = = = = = = = = = = = = = = = = = = = = = = = =");
    log(name);
  }
  log("= = = = = = = = = = = = = = = = = = = = = = = = = =");
  log("$content");
  log("= = = = = = = = = = = = = = = = = = = = = = = = = =");
}
