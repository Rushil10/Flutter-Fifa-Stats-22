import 'package:fifa_stats/db/configureDB.dart';
import 'package:fifa_stats/screens/HomeScreen.dart';
import 'package:fifa_stats/screens/SetUpLocalDb.dart';
import 'package:fifa_stats/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
//import 'package:native_ads_example/native_ad_view_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FacebookAudienceNetwork.init(
    testingId: "a8e3bc54-4e5a-4438-b82b-039f63286518",
  );
  /* List<String> testDeviceIds = ['E25EE02DA7817F620865558627D4F3E0'];
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  MobileAds.instance.initialize();
  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  MobileAds.instance.updateRequestConfiguration(configuration); */
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifa Stats',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeClass.darkTheme,
      theme: ThemeClass.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SetUpLocalDb(),
    );
  }
}
