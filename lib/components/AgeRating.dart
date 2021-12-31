import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class AgeRating extends StatelessWidget {
  final age;
  const AgeRating({Key? key, this.age}) : super(key: key);

  Color bgColor() {
    if (age >= 35) {
      const color = red;
      return color;
    } else if (age >= 30) {
      const color = yellow;
      return color;
    } else if (age >= 25) {
      const color = lightGreen;
      return color;
    } else if (age >= 20) {
      const color = green;
      return color;
    } else {
      const color = darkGreen;
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
          age.toString(),
          style: TextStyle(fontSize: ratingFont, fontWeight: ratingFontWeight),
        ),
      ),
    );
  }
}
