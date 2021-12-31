import 'package:fifa_stats/components/AgeRating.dart';
import 'package:fifa_stats/components/OverallRating.dart';
import 'package:fifa_stats/components/PotentialRating.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final playerData;
  const PlayerCard({Key? key, this.playerData}) : super(key: key);

  String playerPositions() {
    String pos = playerData['player_positions'];
    List li = pos.split(",");
    String p = "";
    for (int i = 0; i < li.length; i++) {
      p += li[i];
      p += " ";
    }
    return p;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
      child: Row(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OverallRating(
                  overall: playerData['overall'],
                ),
                Container(
                  width: queryData.size.width * 0.01,
                ),
                PotentialRating(
                  potential: playerData['potential'],
                ),
                Container(
                  width: queryData.size.width * 0.01,
                ),
                AgeRating(
                  age: playerData['age'],
                ),
                Container(
                  width: queryData.size.width * 0.02,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  playerData['short_name'],
                  style: TextStyle(
                      fontSize: ratingCardFont, fontWeight: ratingCardWeight),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  playerPositions(),
                  style: TextStyle(
                      color: posColor,
                      fontWeight: posFontWeight,
                      fontSize: clubNameFontSize),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    playerData['club_name'],
                    style: TextStyle(
                        color: clubNameColor, fontSize: clubNameFontSize),
                  ))
            ],
          ),
          Expanded(child: Container()),
          Container(
            width: queryData.size.width * 0.11,
            height: queryData.size.width * 0.11,
            child: Image.network(playerData['player_face_url']),
          )
        ],
      ),
    );
  }
}
