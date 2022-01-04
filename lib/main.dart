import 'package:fifa_stats/db/configureDB.dart';
import 'package:fifa_stats/screens/HomeScreen.dart';
import 'package:fifa_stats/screens/SetUpLocalDb.dart';
import 'package:fifa_stats/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:native_ads_example/native_ad_view_wrapper.dart';

void main() {
  List<String> testDeviceIds = ['E25EE02DA7817F620865558627D4F3E0'];
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  MobileAds.instance.initialize();
  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  MobileAds.instance.updateRequestConfiguration(configuration);
  runApp(const MyApp());
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
    /* return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screhile waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Fifa Stats',
            themeMode: ThemeMode.dark,
            darkTheme: ThemeClass.darkTheme,
            theme: ThemeClass.lightTheme,
            debugShowCheckedModeBanner: false,
            home: SetUpLocalDb(),
          );
        }
      },
    ); */
  }
}

/* class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
          child: lightMode
              ? Image.asset('assets/images/logo2.jpg')
              : Image.asset('assets/images/logo2.jpg')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    //await Future.delayed(const Duration(seconds: 2));
  }
} */
