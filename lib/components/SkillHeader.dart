import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class SkillHeader extends StatelessWidget {
  final header;
  const SkillHeader({Key? key, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: posColor),
      child: Text(header,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black)),
    );
  }
}
