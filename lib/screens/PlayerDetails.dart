import 'package:fifa_stats/State/VideoAdState.dart';
import 'package:fifa_stats/ads/BannerAdSmall.dart';
import 'package:fifa_stats/ads/ad_helper.dart';
import 'package:fifa_stats/components/ClubDetails.dart';
import 'package:fifa_stats/ads/MediumNativeAd.dart';
import 'package:fifa_stats/components/GameAttributes.dart';
import 'package:fifa_stats/components/PlayerDetailsRatingCard.dart';
import 'package:fifa_stats/components/SkillsRating.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerDetails extends ConsumerStatefulWidget {
  final player;
  final count;
  PlayerDetails({Key? key, this.player, this.count}) : super(key: key);

  @override
  _PlayerDetailsState createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends ConsumerState<PlayerDetails> {
  @override
  var loading = true;
  var playerDetails = {};
  InterstitialAd? _interstitialAd;
  bool fav = false;

  void initState() {
    super.initState();
    ref.read(videoAdProvider);
    if (widget.count % 5 == 0) {
      addInterstitialAd();
    }
    getPlayerData();
    checkIfFav();
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

  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  void getPlayerData() async {
    setState(() {
      loading = true;
    });
    var det =
        await PlayersDatabase.instance.getPlayerDetails(widget.player['id']);
    print(det[0]);
    setState(() {
      playerDetails = det[0];
      loading = false;
    });
  }

  void checkIfFav() async {
    bool f = await PlayersDatabase.instance.checkFav(widget.player['id']);
    setState(() {
      fav = f;
    });
  }

  void addToFavourites() async {
    await PlayersDatabase.instance.searchFavourites(widget.player['id']);
    setState(() {
      fav = !fav;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.player['short_name']),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.star_border_rounded,
              color: fav ? Colors.amber : Colors.white,
              size: 32,
            ),
            onPressed: () {
              addToFavourites();
            },
          )
        ],
      ),
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
                child: !loading
                    ? Column(
                        children: [
                          PlayerDetailsRatingCard(
                            playerData: playerDetails,
                          ),
                          ClubDetails(
                            clubData: playerDetails,
                          ),
                          MediumNativeAd(),
                          GameAttributes(
                            gameData: playerDetails,
                          ),
                          SkillsRating(
                            skills: playerDetails,
                          )
                        ],
                      )
                    : Center(
                        child: Container(
                          child: Text('Loading'),
                        ),
                      ))),
        BannerSmallAd(),
      ]),
    );
  }
}
