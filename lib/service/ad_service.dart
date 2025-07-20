import 'package:injectable/injectable.dart';

@singleton
class AdService {
  // Ad unit IDs - replace with your production IDs before release
  static const String rewardedAdUnitId =
      // 'ca-app-pub-5333475889663851/2733781990';
      'ca-app-pub-3940256099942544/5224354917'; // Test ID

  static const String interstitialAdUnitId =
      // 'ca-app-pub-5333475889663851/6047191107';
      'ca-app-pub-3940256099942544/1033173712'; // Test ID

  static const String bannerAdUnitId =
      // 'ca-app-pub-5333475889663851/3936312322';
      'ca-app-pub-3940256099942544/6300978111'; // Test ID
}
