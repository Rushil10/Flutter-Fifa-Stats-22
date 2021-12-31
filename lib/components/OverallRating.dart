import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class OverallRating extends StatelessWidget {
  final overall;
  const OverallRating({Key? key, this.overall}) : super(key: key);

  Color bgColor() {
    if (overall >= 90) {
      const color = darkGreen;
      return color;
    } else if (overall >= 80) {
      const color = green;
      return color;
    } else if (overall >= 70) {
      const color = lightGreen;
      return color;
    } else if (overall >= 50) {
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
      width: queryData.size.width * 0.11,
      height: queryData.size.width * 0.11,
      decoration: BoxDecoration(color: bgColor()),
      child: Center(
        child: Text(
          overall.toString(),
          style: TextStyle(fontSize: ratingFont, fontWeight: ratingFontWeight),
        ),
      ),
    );
  }
}
