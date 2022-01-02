import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class FootDetails extends StatelessWidget {
  final foot;
  final cardWidth;
  const FootDetails({Key? key, this.cardWidth, this.foot}) : super(key: key);

  Color bgColor() {
    if (foot == "Left") {
      const color = yellow;
      return color;
    } else {
      const color = yellow;
      return color;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      width: queryData.size.width * cardWidth,
      height: queryData.size.width * cardWidth,
      decoration: BoxDecoration(color: bgColor()),
      child: Center(
        child: Text(
          foot[0].toString(),
          style: TextStyle(
              fontSize: ratingFont,
              color: Colors.black,
              fontWeight: ratingFontWeight),
        ),
      ),
    );
  }
}
