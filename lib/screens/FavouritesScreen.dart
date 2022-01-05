import 'package:fifa_stats/ads/ad_helper.dart';
import 'package:fifa_stats/components/playerCard.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Favourites extends StatefulWidget {
  final type;
  final title;
  final count;
  Favourites({Key? key, this.type, this.title, this.count}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  var loading = true;
  var players = [];
  InterstitialAd? _interstitialAd;

  void initState() {
    super.initState();
    if (widget.type == "Fav") {
      getFavouritePlayers();
    }
    if (widget.type == "Young") {
      getYoungPlayers();
    }
    if (widget.type == "Free") {
      getAllFreePlayers();
    }
    if (widget.count % 5 == 0) {
      addInterstitialAd();
    }
  }

  void addInterstitialAd() async {
    InterstitialAd.load(
        adUnitId: AdHelper.videoAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _interstitialAd!.setImmersiveMode(true);
            _interstitialAd!.show();
            //ref.read(videoAdProvider.notifier).increment();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
          },
        ));
  }

  void getFavouritePlayers() async {
    var all = await PlayersDatabase.instance.getFavourites();
    setState(() {
      players = all;
      loading = false;
    });
  }

  void getAllFreePlayers() async {
    var all = await PlayersDatabase.instance.getFreeAgents();
    setState(() {
      players = all;
      loading = false;
    });
  }

  void getYoungPlayers() async {
    var all = await PlayersDatabase.instance.getYoungPlayers();
    setState(() {
      players = all;
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                  //BannerSmallAd(),
                ],
              )
            : Center(
                child: Container(
                  width: 45,
                  height: 45,
                  child: CircularProgressIndicator(
                    color: posColor,
                  ),
                ),
              ));
  }
}
