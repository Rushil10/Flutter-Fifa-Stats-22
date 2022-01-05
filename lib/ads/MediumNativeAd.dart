import 'package:fifa_stats/ads/ad_helper.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MediumNativeAd extends StatefulWidget {
  const MediumNativeAd({Key? key}) : super(key: key);

  @override
  _MediumNativeAdState createState() => _MediumNativeAdState();
}

class _MediumNativeAdState extends State<MediumNativeAd> {
  late NativeAd _adMedium;
  bool _isAdLoadedMedium = false;

  void initState() {
    super.initState();
    getNativeAdd();
  }

  void getNativeAdd() async {
    _adMedium = NativeAd(
      // Here in adUnitId: add your own ad unit ID before release build

      adUnitId: AdHelper.nativeAdUnitId,
      factoryId: 'listTileMedium',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoadedMedium = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _adMedium.load();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(11),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(border: Border.all(color: posColor)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: posColor),
              child: Text('Sponsored Ad',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
            ),
            _isAdLoadedMedium
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      child: AdWidget(ad: _adMedium),
                      height: width - 35,
                      width: width - 35,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: CircularProgressIndicator(),
                    ))
          ],
        ));
  }
}
