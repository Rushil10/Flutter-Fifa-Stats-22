import 'package:fifa_stats/components/AgeRating.dart';
import 'package:fifa_stats/components/FootDetails.dart';
import 'package:fifa_stats/components/OverallRating.dart';
import 'package:fifa_stats/components/PotentialRating.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class PlayerDetailsRatingCard extends StatelessWidget {
  final playerData;
  const PlayerDetailsRatingCard({Key? key, this.playerData}) : super(key: key);

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
    double width = MediaQuery.of(context).size.width;
    double remWidth = width - 24;
    return Container(
      margin: EdgeInsets.all(11),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 11),
      decoration: BoxDecoration(border: Border.all(color: posColor)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: posColor),
            child: Text('PLAYER DETAILS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: remWidth * 0.32,
                  height: 0.38 * remWidth,
                  child: Column(
                    children: [
                      Container(
                        height: 0.19 * remWidth,
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Text(
                              'OVR',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            OverallRating(
                              overall: playerData['overall'],
                              cardWidth: detailsPageWidth,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.19 * remWidth,
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            AgeRating(
                              age: playerData['age'],
                              cardWidth: detailsPageWidth,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //decoration: BoxDecoration(color: Colors.green),
                  width: remWidth * 0.35,
                  height: remWidth * 0.38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          playerPositions(),
                          style: TextStyle(
                              color: posColor,
                              fontWeight: posDetFontWeight,
                              fontSize: posFontSize),
                        ),
                      ),
                      Container(
                        height: remWidth * 0.32,
                        width: remWidth * 0.32,
                        child: Image.network(playerData['player_face_url']),
                      )
                    ],
                  ),
                ),
                Container(
                  width: remWidth * 0.32,
                  height: remWidth * 0.38,
                  child: Column(
                    children: [
                      Container(
                        height: 0.19 * remWidth,
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              'POT',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            PotentialRating(
                              potential: playerData['potential'],
                              cardWidth: detailsPageWidth,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.19 * remWidth,
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'FOOT',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            FootDetails(
                              foot: playerData['preferred_foot'],
                              cardWidth: detailsPageWidth,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              playerData['long_name'],
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: 3,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 0.045 * remWidth,
                  child: Image.network(playerData['nation_flag_url']),
                ),
                Container(
                  child: Text(' '),
                ),
                Container(
                  child: Text(
                    playerData['nationality_name'],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  child: Text(' - '),
                ),
                Container(
                  child: Text(
                    playerData['dob'],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  child: Text(' - '),
                ),
                Container(
                  child: Text(
                    playerData['height_cm'].toString() + ' cm',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  child: Text(' - '),
                ),
                Container(
                  child: Text(
                    playerData['weight_kg'].toString() + ' kg',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 0.5 * remWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'REAL FACE: ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Yes',
                        style: TextStyle(color: lightGreen, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 0.5 * remWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Jersey: ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        playerData['club_jersey_number'] == 0
                            ? 'None'
                            : playerData['club_jersey_number'].toString(),
                        style: TextStyle(color: lightGreen, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
