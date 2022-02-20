import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'dart:io';

class FBBannerAd extends StatefulWidget {
  FBBannerAd({Key? key}) : super(key: key);

  @override
  State<FBBannerAd> createState() => _FBBannerAdState();
}

class _FBBannerAdState extends State<FBBannerAd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment(0.5, 1),
      child: FacebookBannerAd(
        placementId: Platform.isAndroid
            ? "502425541242074_502434997907795"
            : "YOUR_IOS_PLACEMENT_ID",
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          switch (result) {
            case BannerAdResult.ERROR:
              print("Error: $value");
              break;
            case BannerAdResult.LOADED:
              print("Loaded: $value");
              break;
            case BannerAdResult.CLICKED:
              print("Clicked: $value");
              break;
            case BannerAdResult.LOGGING_IMPRESSION:
              print("Logging Impression: $value");
              break;
          }
        },
      ),
    );
  }
}
