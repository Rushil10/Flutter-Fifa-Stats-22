import 'package:fifa_stats/components/AgeRating.dart';
import 'package:fifa_stats/components/OverallRating.dart';
import 'package:fifa_stats/components/PotentialRating.dart';
import 'package:fifa_stats/screens/PlayerDetails.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  final playerData;
  const PlayerCard({Key? key, this.playerData}) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  String playerPositions() {
    String pos = widget.playerData['player_positions'];
    List li = pos.split(",");
    String p = "";
    for (int i = 0; i < li.length; i++) {
      p += li[i];
      p += " ";
    }
    return p;
  }

  void onTapPlayer() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlayerDetails(
                  player: widget.playerData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTapPlayer,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
        child: Row(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OverallRating(
                    overall: widget.playerData['overall'],
                    cardWidth: mainPageWidth,
                  ),
                  Container(
                    width: queryData.size.width * 0.01,
                  ),
                  PotentialRating(
                    potential: widget.playerData['potential'],
                    cardWidth: mainPageWidth,
                  ),
                  Container(
                    width: queryData.size.width * 0.01,
                  ),
                  AgeRating(
                    age: widget.playerData['age'],
                    cardWidth: mainPageWidth,
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
                    widget.playerData['short_name'],
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
                      widget.playerData['club_name'],
                      style: TextStyle(
                          color: clubNameColor, fontSize: clubNameFontSize),
                    ))
              ],
            ),
            Expanded(child: Container()),
            Container(
              width: queryData.size.width * 0.11,
              height: queryData.size.width * 0.11,
              child: Image.network(widget.playerData['player_face_url']),
            )
          ],
        ),
      ),
    );
  }
}
