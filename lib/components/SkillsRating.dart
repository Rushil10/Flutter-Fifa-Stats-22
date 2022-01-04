import 'package:fifa_stats/components/SkillCard.dart';
import 'package:fifa_stats/components/SkillHeader.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class SkillsRating extends StatelessWidget {
  final skills;
  const SkillsRating({Key? key, this.skills}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(skills['goalkeeping_speed'].runtimeType);
    return Container(
        margin: EdgeInsets.all(11),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 11),
        decoration: BoxDecoration(border: Border.all(color: posColor)),
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: posColor),
            child: Text('SKILLS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
          ),
          SkillHeader(
            header: 'PACE',
          ),
          SkillCard(
            rating: skills['movement_acceleration'],
            cardWidth: ratingWidthDetails,
            skill: 'Acceleration',
          ),
          SkillCard(
            rating: skills['movement_sprint_speed'],
            cardWidth: ratingWidthDetails,
            skill: 'Sprint Speed',
          ),
          SkillHeader(
            header: 'SHOOTING',
          ),
          SkillCard(
            rating: skills['mentality_positioning'],
            cardWidth: ratingWidthDetails,
            skill: 'Att. Posistioning',
          ),
          SkillCard(
            rating: skills['attacking_finishing'],
            cardWidth: ratingWidthDetails,
            skill: 'Finishing',
          ),
          SkillCard(
            rating: skills['power_shot_power'],
            cardWidth: ratingWidthDetails,
            skill: 'Shot Power',
          ),
          SkillCard(
            rating: skills['power_long_shots'],
            cardWidth: ratingWidthDetails,
            skill: 'Long Shots',
          ),
          SkillCard(
            rating: skills['attacking_volleys'],
            cardWidth: ratingWidthDetails,
            skill: 'Volleys',
          ),
          SkillCard(
            rating: skills['mentality_penalties'],
            cardWidth: ratingWidthDetails,
            skill: 'Penalties',
          ),
          SkillHeader(
            header: 'PASSING',
          ),
          SkillCard(
            rating: skills['mentality_vision'],
            cardWidth: ratingWidthDetails,
            skill: 'Vision',
          ),
          SkillCard(
            rating: skills['attacking_crossing'],
            cardWidth: ratingWidthDetails,
            skill: 'Crossing',
          ),
          SkillCard(
            rating: skills['skill_fk_accuracy'],
            cardWidth: ratingWidthDetails,
            skill: 'Free Kick Accuracy',
          ),
          SkillCard(
            rating: skills['attacking_short_passing'],
            cardWidth: ratingWidthDetails,
            skill: 'Short Passing',
          ),
          SkillCard(
            rating: skills['skill_long_passing'],
            cardWidth: ratingWidthDetails,
            skill: 'Long Passing',
          ),
          SkillCard(
            rating: skills['skill_curve'],
            cardWidth: ratingWidthDetails,
            skill: 'Curve',
          ),
          SkillHeader(
            header: 'DRIBBLING',
          ),
          SkillCard(
            rating: skills['movement_agility'],
            cardWidth: ratingWidthDetails,
            skill: 'Agility',
          ),
          SkillCard(
            rating: skills['movement_balance'],
            cardWidth: ratingWidthDetails,
            skill: 'Balance',
          ),
          SkillCard(
            rating: skills['movement_reactions'],
            cardWidth: ratingWidthDetails,
            skill: 'Reactions',
          ),
          SkillCard(
            rating: skills['skill_ball_control'],
            cardWidth: ratingWidthDetails,
            skill: 'Ball Control',
          ),
          SkillCard(
            rating: skills['skill_dribbling'],
            cardWidth: ratingWidthDetails,
            skill: 'Dribbling',
          ),
          SkillCard(
            rating: skills['mentality_composure'],
            cardWidth: ratingWidthDetails,
            skill: 'Composure',
          ),
          SkillHeader(
            header: 'DEFENDING',
          ),
          SkillCard(
            rating: skills['mentality_interceptions'],
            cardWidth: ratingWidthDetails,
            skill: 'Interceptions',
          ),
          SkillCard(
            rating: skills['attacking_heading_accuracy'],
            cardWidth: ratingWidthDetails,
            skill: 'Heading Accuracy',
          ),
          SkillCard(
            rating: skills['defending_marking_awareness'],
            cardWidth: ratingWidthDetails,
            skill: 'Marking',
          ),
          SkillCard(
            rating: skills['defending_standing_tackle'],
            cardWidth: ratingWidthDetails,
            skill: 'Standing Tackle',
          ),
          SkillCard(
            rating: skills['defending_sliding_tackle'],
            cardWidth: ratingWidthDetails,
            skill: 'Sliding Tackle',
          ),
          SkillCard(
            rating: skills['power_jumping'],
            cardWidth: ratingWidthDetails,
            skill: 'Jumping',
          ),
          SkillHeader(
            header: 'PHYSICAL',
          ),
          SkillCard(
            rating: skills['power_stamina'],
            cardWidth: ratingWidthDetails,
            skill: 'Stamina',
          ),
          SkillCard(
            rating: skills['power_strength'],
            cardWidth: ratingWidthDetails,
            skill: 'Strength',
          ),
          SkillCard(
            rating: skills['mentality_aggression'],
            cardWidth: ratingWidthDetails,
            skill: 'Aggression',
          ),
          SkillHeader(
            header: 'GOALKEEPING',
          ),
          SkillCard(
            rating: skills['goalkeeping_diving'],
            cardWidth: ratingWidthDetails,
            skill: 'Diving',
          ),
          SkillCard(
            rating: skills['goalkeeping_handling'],
            cardWidth: ratingWidthDetails,
            skill: 'Handling',
          ),
          SkillCard(
            rating: skills['goalkeeping_kicking'],
            cardWidth: ratingWidthDetails,
            skill: 'Kicking',
          ),
          SkillCard(
            rating: skills['goalkeeping_reflexes'],
            cardWidth: ratingWidthDetails,
            skill: 'Reflexes',
          ),
          /* SkillCard(
            rating:,
            cardWidth: ratingWidthDetails,
            skill: 'Speed',
          ), */
          skills['goalkeeping_reflexes'].runtimeType == int
              ? SkillCard(
                  rating: skills['goalkeeping_reflexes'],
                  cardWidth: ratingWidthDetails,
                  skill: 'Speed',
                )
              : SkillCard(
                  rating: int.parse(skills['goalkeeping_reflexes']),
                  cardWidth: ratingWidthDetails,
                  skill: 'Speed',
                ),
          SkillCard(
            rating: skills['goalkeeping_positioning'],
            cardWidth: ratingWidthDetails,
            skill: 'Posistioning',
          ),
        ]));
  }
}
