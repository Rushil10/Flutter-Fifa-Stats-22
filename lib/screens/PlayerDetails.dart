import 'package:fifa_stats/components/PlayerDetailsRatingCard.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:flutter/material.dart';

class PlayerDetails extends StatefulWidget {
  final player;
  PlayerDetails({Key? key, this.player}) : super(key: key);

  @override
  _PlayerDetailsState createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  @override
  var loading = true;
  var playerDetails = {};

  void initState() {
    super.initState();
    getPlayerData();
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.player['short_name']),
        ),
        body: !loading
            ? Column(
                children: [
                  PlayerDetailsRatingCard(
                    playerData: playerDetails,
                  )
                ],
              )
            : Center(
                child: Container(
                  child: Text('Loading'),
                ),
              ));
  }
}
