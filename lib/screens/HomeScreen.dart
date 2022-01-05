import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:fifa_stats/State/VideoAdState.dart';
import 'package:fifa_stats/ads/BannerAdSmall.dart';
import 'package:fifa_stats/ads/ad_helper.dart';
import 'package:fifa_stats/components/playerCard.dart';
import 'package:fifa_stats/db/Player.dart';
import 'package:fifa_stats/db/configureDB.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:fifa_stats/screens/FavouritesScreen.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:convert' show utf8;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  var loading = true;
  var players = [];

  void initState() {
    super.initState();
    ref.read(videoAdProvider);
    getTop100PlayerData();
  }

  Future getTop100PlayerData() async {
    setState(() {
      loading = true;
    });
    var top100Players = await PlayersDatabase.instance.top100Players();
    print(top100Players.length);
    setState(() {
      players = top100Players;
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: posColor,
                ),
                child: Text(
                  'Player Stats 22',
                  style: TextStyle(color: Colors.black, fontSize: 21),
                ),
              ),
              ListTile(
                title: const Text('Favourites'),
                onTap: () {
                  final count = ref.watch(videoAdProvider);
                  print(count);
                  ref.read(videoAdProvider.notifier).increment();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favourites(
                                type: "Fav",
                                title: "Favourites",
                                count: count,
                              )));
                },
              ),
              ListTile(
                title: const Text('Emerging Players'),
                onTap: () {
                  final count = ref.watch(videoAdProvider);
                  print(count);
                  ref.read(videoAdProvider.notifier).increment();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favourites(
                                type: "Young",
                                title: "Emerging Players",
                                count: count,
                              )));
                },
              ),
              ListTile(
                title: const Text('Free Agents'),
                onTap: () {
                  final count = ref.watch(videoAdProvider);
                  print(count);
                  ref.read(videoAdProvider.notifier).increment();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favourites(
                                type: "Free",
                                title: "Free Agents",
                                count: count,
                              )));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Player Stats 22"),
        ),
        body: !loading
            ? Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: queryData.size.width * 0.12,
                          alignment: Alignment.center,
                          child: Text(
                            'OVR',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Container(
                          width: queryData.size.width * 0.12,
                          alignment: Alignment.center,
                          child: Text(
                            'POT',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Container(
                          width: queryData.size.width * 0.12,
                          alignment: Alignment.center,
                          child: Text(
                            'AGE',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: players.length,
                          itemBuilder: (context, index) {
                            return PlayerCard(
                              playerData: players[index],
                            );
                          })),
                  BannerSmallAd(),
                ],
              )
            : Center(
                child: Container(
                  height: 45,
                  width: 45,
                  child: CircularProgressIndicator(
                    color: posColor,
                  ),
                ),
              ));
  }
}
