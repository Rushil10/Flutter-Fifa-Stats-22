import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:fifa_stats/db/Player.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:flutter/material.dart';

void readDB() async {
  await PlayersDatabase.instance.readDb();
}

void createListOfFields() async{
  //print(cur);
  final mydata  = await rootBundle.loadString('assets/images/players_22.csv');
  final con = await CsvToListConverter().convert(mydata);
  var i = 1;
  int j = 0;
  for(int i=1;i<19240;i++){
    var player = Player(
      sofifaId : con[i][j++],
      playerUrl : con[i][j++],
      shortName : con[i][j++],
      longName : con[i][j++],
      playerPositions : con[i][j++],
      overall : con[i][j++],
      potential : con[i][j++],
      valueEur : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      wageEur : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      age : con[i][j++],
      dob : con[i][j++],
      heightCm : con[i][j++],
      weightKg : con[i][j++],
      clubTeamId : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      clubName : con[i][j++],
      leagueName : con[i][j++],
      leagueLevel : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      clubPosition : con[i][j++],
      clubJerseyNumber : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      clubLoanedFrom : con[i][j++],
      clubJoined : con[i][j++],
      clubContractValidUntil : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      nationalityId : con[i][j++],
      nationalityName : con[i][j++],
      nationTeamId : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      nationPosition : con[i][j++],
      nationJerseyNumber : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      preferredFoot : con[i][j++],
      weakFoot : con[i][j++],
      skillMoves : con[i][j++],
      internationalReputation : con[i][j++],
      workRate : con[i][j++],
      bodyType : con[i][j++],
      realFace : con[i][j++],
      releaseClauseEur : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      playerTags : con[i][j++],
      playerTraits : con[i][j++],
      pace : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      shooting : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      passing : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      dribbling : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      defending : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      physic : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      attackingCrossing : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      attackingFinishing : con[i][j++],
      attackingHeadingAccuracy : con[i][j++],
      attackingShortPassing : con[i][j++],
      attackingVolleys : con[i][j++],
      skillDribbling : con[i][j++],
      skillCurve : con[i][j++],
      skillFkAccuracy : con[i][j++],
      skillLongPassing : con[i][j++],
      skillBallControl : con[i][j++],
      movementAcceleration : con[i][j++],
      movementSprintSpeed : con[i][j++],
      movementAgility : con[i][j++],
      movementReactions : con[i][j++],
      movementBalance : con[i][j++],
      powerShotPower : con[i][j++],
      powerJumping : con[i][j++],
      powerStamina : con[i][j++],
      powerStrength : con[i][j++],
      powerLongShots : con[i][j++],
      mentalityAggression : con[i][j++],
      mentalityInterceptions : con[i][j++],
      mentalityPositioning : con[i][j++],
      mentalityVision : con[i][j++],
      mentalityPenalties : con[i][j++],
      mentalityComposure : con[i][j++],
      defendingMarkingAwareness : con[i][j++],
      defendingStandingTackle : con[i][j++],
      defendingSlidingTackle : con[i][j++],
      goalkeepingDiving : con[i][j++],
      goalkeepingHandling : con[i][j++],
      goalkeepingKicking : con[i][j++],
      goalkeepingPositioning : con[i][j++],
      goalkeepingReflexes : con[i][j++],
      goalkeepingSpeed : con[i][j].runtimeType==String ? con[i][j++] : con[i][j++].toString(),
      ls : con[i][j].runtimeType==String ? con[i][j++] : con[i][j++].toString(),
      st : con[i][j].runtimeType==String ? con[i][j++] : con[i][j++].toString(),
      rs : con[i][j].runtimeType==String ? con[i][j++] : con[i][j++].toString(),
      lw : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      lf : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      cf : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      rf : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      rw : con[i][j].runtimeType!=String ? con[i][j++] : (j++ - j - 1),
      playerFaceUrl : con[i][105],
      clubLogoUrl : con[i][106],
      clubFlagUrl : con[i][107],
      nationLogoUrl : con[i][108],
      nationFlagUrl : con[i][109],
    );
    await PlayersDatabase.instance.insertPlayer(player);
    j=0;
    print(i);
  }
  //PlayersDatabase.instance.insertPlayer(player);
}