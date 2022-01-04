import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final rating;
  final skill;
  final cardWidth;
  const SkillCard({Key? key, this.rating, this.skill, this.cardWidth})
      : super(key: key);

  Color bgColor() {
    if (rating >= 90) {
      const color = darkGreen;
      return color;
    } else if (rating >= 80) {
      const color = green;
      return color;
    } else if (rating >= 70) {
      const color = lightGreen;
      return color;
    } else if (rating >= 50) {
      const color = yellow;
      return color;
    } else {
      const color = red;
      return color;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: queryData.size.width * cardWidth,
            height: queryData.size.width * cardWidth,
            decoration: BoxDecoration(color: bgColor()),
            child: Center(
              child: Text(
                rating.toString(),
                style: TextStyle(
                    fontSize: playerDetailsRatingFont,
                    fontWeight: ratingFontWeight),
              ),
            ),
          ),
          Container(
            width: 5,
          ),
          Text(
            skill,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
