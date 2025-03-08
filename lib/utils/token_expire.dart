// Checking the expiration time

import 'package:livery/utils/custom_print.dart';

bool jwtTokenChecker(Map<String, dynamic>? token) {
  if (token != null && token.containsKey('exp')) {
    int expiryTimeInSeconds = token['exp'];
    DateTime expiryDateTime = DateTime.fromMillisecondsSinceEpoch(
      expiryTimeInSeconds * 1000,
    );

    DateTime currentDateTime = DateTime.now();

    if (currentDateTime.isBefore(expiryDateTime)) {
      customPrint('Token is not expired. Expiry time: $expiryDateTime');
      return true;
    } else {
      customPrint('Token has expired.');
      return false;
    }
  } else {
    customPrint('Invalid JWT token or missing expiration time.');
    return false;
  }
}
