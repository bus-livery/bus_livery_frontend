import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:livery/features/advertisement/advertisement_bloc.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AdvertisementBloc, AdvertisementState, BannerAd?>(
      selector: (state) {
        return state.bannerAd;
      },
      builder: (context, bannerAd) {
        return bannerAd == null
            ? const SizedBox()
            : Container(
              alignment: Alignment.center,
              width: bannerAd.size.width.toDouble(),
              height: bannerAd.size.height.toDouble(),
              child: AdWidget(ad: bannerAd),
            );
      },
    );
  }
}
