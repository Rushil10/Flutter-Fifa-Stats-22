import 'ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerSmallAd extends StatefulWidget {
  BannerSmallAd({Key? key}) : super(key: key);

  @override
  _BannerSmallAdState createState() => _BannerSmallAdState();
}

class _BannerSmallAdState extends State<BannerSmallAd> {
  late BannerAd _ad;
  bool isLoading = false;

  void initState() {
    super.initState();
    setUpBannerAd();
    //setUpDb();
  }

  void setUpBannerAd() async {
    print("Banner Ad");
    _ad = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoading = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Container(
              child: AdWidget(ad: _ad),
              width: _ad.size.width.toDouble(),
              height: _ad.size.height.toDouble(),
              //alignment: Alignment.center,
            )
          : Container(),
    );
  }
}
