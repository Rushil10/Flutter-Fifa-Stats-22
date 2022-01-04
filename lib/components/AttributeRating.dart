import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class AttributeRating extends StatelessWidget {
  final attribute;
  final heading;
  final cardWidth;
  const AttributeRating(
      {Key? key, this.heading, this.attribute, this.cardWidth})
      : super(key: key);

  Color bgColor() {
    if (attribute >= 90) {
      const color = darkGreen;
      return color;
    } else if (attribute >= 80) {
      const color = green;
      return color;
    } else if (attribute >= 70) {
      const color = lightGreen;
      return color;
    } else if (attribute >= 50) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(heading),
        Container(
          height: 2.5,
        ),
        Container(
          width: queryData.size.width * cardWidth,
          height: queryData.size.width * cardWidth,
          decoration: BoxDecoration(color: bgColor()),
          child: Center(
            child: Text(
              attribute.toString(),
              style: TextStyle(
                  fontSize: playerDetailsRatingFont,
                  fontWeight: ratingFontWeight),
            ),
          ),
        )
      ],
    );
  }
}
