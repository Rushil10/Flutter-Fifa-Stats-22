class Player {
  final int? sofifaId;
  final String? playerUrl;
  final String? shortName;
  final String? longName;
  final String? playerPositions;
  final int? overall;
  final int? potential;
  final double? valueEur;
  final double? wageEur;
  final int? age;
  final String? dob;
  final int? heightCm;
  final int? weightKg;
  final double? clubTeamId;
  final String? clubName;
  final String? leagueName;
  final int? leagueLevel;
  final String? clubPosition;
  final int? clubJerseyNumber;
  final String? clubLoanedFrom;
  final String? clubJoined;
  final int? clubContractValidUntil;
  final int? nationalityId;
  final String? nationalityName;
  final double? nationTeamId;
  final String? nationPosition;
  final int? nationJerseyNumber;
  final String? preferredFoot;
  final int? weakFoot;
  final int? skillMoves;
  final int? internationalReputation;
  final String? workRate;
  final String? bodyType;
  final String? realFace;
  final int? releaseClauseEur;
  final String? playerTags;
  final String? playerTraits;
  final int? pace;
  final int? shooting;
  final int? passing;
  final int? dribbling;
  final int? defending;
  final int? physic;
  final int? attackingCrossing;
  final int? attackingFinishing;
  final int? attackingHeadingAccuracy;
  final int? attackingShortPassing;
  final int? attackingVolleys;
  final int? skillDribbling;
  final int? skillCurve;
  final int? skillFkAccuracy;
  final int? skillLongPassing;
  final int? skillBallControl;
  final int? movementAcceleration;
  final int? movementSprintSpeed;
  final int? movementAgility;
  final int? movementReactions;
  final int? movementBalance;
  final int? powerShotPower;
  final int? powerJumping;
  final int? powerStamina;
  final int? powerStrength;
  final int? powerLongShots;
  final int? mentalityAggression;
  final int? mentalityInterceptions;
  final int? mentalityPositioning;
  final int? mentalityVision;
  final int? mentalityPenalties;
  final int? mentalityComposure;
  final int? defendingMarkingAwareness;
  final int? defendingStandingTackle;
  final int? defendingSlidingTackle;
  final int? goalkeepingDiving;
  final int? goalkeepingHandling;
  final int? goalkeepingKicking;
  final int? goalkeepingPositioning;
  final int? goalkeepingReflexes;
  final String? goalkeepingSpeed;
  final String? ls;
  final String? st;
  final String? rs;
  final int? lw;
  final int? lf;
  final int? cf;
  final int? rf;
  final int? rw;
  final String? playerFaceUrl;
  final String? clubLogoUrl;
  final String? clubFlagUrl;
  final String? nationLogoUrl;
  final String? nationFlagUrl;

  Player({
    this.sofifaId,
    this.playerUrl,
    this.shortName,
    this.longName,
    this.playerPositions,
    this.overall,
    this.potential,
    this.valueEur,
    this.wageEur,
    this.age,
    this.dob,
    this.heightCm,
    this.weightKg,
    this.clubTeamId,
    this.clubName,
    this.leagueName,
    this.leagueLevel,
    this.clubPosition,
    this.clubJerseyNumber,
    this.clubLoanedFrom,
    this.clubJoined,
    this.clubContractValidUntil,
    this.nationalityId,
    this.nationalityName,
    this.nationTeamId,
    this.nationPosition,
    this.nationJerseyNumber,
    this.preferredFoot,
    this.weakFoot,
    this.skillMoves,
    this.internationalReputation,
    this.workRate,
    this.bodyType,
    this.realFace,
    this.releaseClauseEur,
    this.playerTags,
    this.playerTraits,
    this.pace,
    this.shooting,
    this.passing,
    this.dribbling,
    this.defending,
    this.physic,
    this.attackingCrossing,
    this.attackingFinishing,
    this.attackingHeadingAccuracy,
    this.attackingShortPassing,
    this.attackingVolleys,
    this.skillDribbling,
    this.skillCurve,
    this.skillFkAccuracy,
    this.skillLongPassing,
    this.skillBallControl,
    this.movementAcceleration,
    this.movementSprintSpeed,
    this.movementAgility,
    this.movementReactions,
    this.movementBalance,
    this.powerShotPower,
    this.powerJumping,
    this.powerStamina,
    this.powerStrength,
    this.powerLongShots,
    this.mentalityAggression,
    this.mentalityInterceptions,
    this.mentalityPositioning,
    this.mentalityVision,
    this.mentalityPenalties,
    this.mentalityComposure,
    this.defendingMarkingAwareness,
    this.defendingStandingTackle,
    this.defendingSlidingTackle,
    this.goalkeepingDiving,
    this.goalkeepingHandling,
    this.goalkeepingKicking,
    this.goalkeepingPositioning,
    this.goalkeepingReflexes,
    this.goalkeepingSpeed,
    this.ls,
    this.st,
    this.rs,
    this.lw,
    this.lf,
    this.cf,
    this.rf,
    this.rw,
    this.playerFaceUrl,
    this.clubLogoUrl,
    this.clubFlagUrl,
    this.nationLogoUrl,
    this.nationFlagUrl,
  });

  Player.fromJson(Map<String, dynamic> json)
      : sofifaId = json['sofifa_id'] as int?,
        playerUrl = json['player_url'] as String?,
        shortName = json['short_name'] as String?,
        longName = json['long_name'] as String?,
        playerPositions = json['player_positions'] as String?,
        overall = json['overall'] as int?,
        potential = json['potential'] as int?,
        valueEur = json['value_eur'] as double?,
        wageEur = json['wage_eur'] as double?,
        age = json['age'] as int?,
        dob = json['dob'] as String?,
        heightCm = json['height_cm'] as int?,
        weightKg = json['weight_kg'] as int?,
        clubTeamId = json['club_team_id'] as double?,
        clubName = json['club_name'] as String?,
        leagueName = json['league_name'] as String?,
        leagueLevel = json['league_level'] as int?,
        clubPosition = json['club_position'] as String?,
        clubJerseyNumber = json['club_jersey_number'] as int?,
        clubLoanedFrom = json['club_loaned_from'] as String?,
        clubJoined = json['club_joined'] as String?,
        clubContractValidUntil = json['club_contract_valid_until'] as int?,
        nationalityId = json['nationality_id'] as int?,
        nationalityName = json['nationality_name'] as String?,
        nationTeamId = json['nation_team_id'] as double?,
        nationPosition = json['nation_position'] as String?,
        nationJerseyNumber = json['nation_jersey_number'] as int?,
        preferredFoot = json['preferred_foot'] as String?,
        weakFoot = json['weak_foot'] as int?,
        skillMoves = json['skill_moves'] as int?,
        internationalReputation = json['international_reputation'] as int?,
        workRate = json['work_rate'] as String?,
        bodyType = json['body_type'] as String?,
        realFace = json['real_face'] as String?,
        releaseClauseEur = json['release_clause_eur'] as int?,
        playerTags = json['player_tags'] as String?,
        playerTraits = json['player_traits'] as String?,
        pace = json['pace'] as int?,
        shooting = json['shooting'] as int?,
        passing = json['passing'] as int?,
        dribbling = json['dribbling'] as int?,
        defending = json['defending'] as int?,
        physic = json['physic'] as int?,
        attackingCrossing = json['attacking_crossing'] as int?,
        attackingFinishing = json['attacking_finishing'] as int?,
        attackingHeadingAccuracy = json['attacking_heading_accuracy'] as int?,
        attackingShortPassing = json['attacking_short_passing'] as int?,
        attackingVolleys = json['attacking_volleys'] as int?,
        skillDribbling = json['skill_dribbling'] as int?,
        skillCurve = json['skill_curve'] as int?,
        skillFkAccuracy = json['skill_fk_accuracy'] as int?,
        skillLongPassing = json['skill_long_passing'] as int?,
        skillBallControl = json['skill_ball_control'] as int?,
        movementAcceleration = json['movement_acceleration'] as int?,
        movementSprintSpeed = json['movement_sprint_speed'] as int?,
        movementAgility = json['movement_agility'] as int?,
        movementReactions = json['movement_reactions'] as int?,
        movementBalance = json['movement_balance'] as int?,
        powerShotPower = json['power_shot_power'] as int?,
        powerJumping = json['power_jumping'] as int?,
        powerStamina = json['power_stamina'] as int?,
        powerStrength = json['power_strength'] as int?,
        powerLongShots = json['power_long_shots'] as int?,
        mentalityAggression = json['mentality_aggression'] as int?,
        mentalityInterceptions = json['mentality_interceptions'] as int?,
        mentalityPositioning = json['mentality_positioning'] as int?,
        mentalityVision = json['mentality_vision'] as int?,
        mentalityPenalties = json['mentality_penalties'] as int?,
        mentalityComposure = json['mentality_composure'] as int?,
        defendingMarkingAwareness = json['defending_marking_awareness'] as int?,
        defendingStandingTackle = json['defending_standing_tackle'] as int?,
        defendingSlidingTackle = json['defending_sliding_tackle'] as int?,
        goalkeepingDiving = json['goalkeeping_diving'] as int?,
        goalkeepingHandling = json['goalkeeping_handling'] as int?,
        goalkeepingKicking = json['goalkeeping_kicking'] as int?,
        goalkeepingPositioning = json['goalkeeping_positioning'] as int?,
        goalkeepingReflexes = json['goalkeeping_reflexes'] as int?,
        goalkeepingSpeed = json['goalkeeping_speed'] as String?,
        ls = json['ls'] as String?,
        st = json['st'] as String?,
        rs = json['rs'] as String?,
        lw = json['lw'] as int?,
        lf = json['lf'] as int?,
        cf = json['cf'] as int?,
        rf = json['rf'] as int?,
        rw = json['rw'] as int?,
        playerFaceUrl = json['player_face_url'] as String?,
        clubLogoUrl = json['club_logo_url'] as String?,
        clubFlagUrl = json['club_flag_url'] as String?,
        nationLogoUrl = json['nation_logo_url'] as String?,
        nationFlagUrl = json['nation_flag_url'] as String?;

  Map<String, dynamic> toJson() => {
    'sofifa_id' : sofifaId,
    'player_url' : playerUrl,
    'short_name' : shortName,
    'long_name' : longName,
    'player_positions' : playerPositions,
    'overall' : overall,
    'potential' : potential,
    'value_eur' : valueEur,
    'wage_eur' : wageEur,
    'age' : age,
    'dob' : dob,
    'height_cm' : heightCm,
    'weight_kg' : weightKg,
    'club_team_id' : clubTeamId,
    'club_name' : clubName,
    'league_name' : leagueName,
    'league_level' : leagueLevel,
    'club_position' : clubPosition,
    'club_jersey_number' : clubJerseyNumber,
    'club_loaned_from' : clubLoanedFrom,
    'club_joined' : clubJoined,
    'club_contract_valid_until' : clubContractValidUntil,
    'nationality_id' : nationalityId,
    'nationality_name' : nationalityName,
    'nation_team_id' : nationTeamId,
    'nation_position' : nationPosition,
    'nation_jersey_number' : nationJerseyNumber,
    'preferred_foot' : preferredFoot,
    'weak_foot' : weakFoot,
    'skill_moves' : skillMoves,
    'international_reputation' : internationalReputation,
    'work_rate' : workRate,
    'body_type' : bodyType,
    'real_face' : realFace,
    'release_clause_eur' : releaseClauseEur,
    'player_tags' : playerTags,
    'player_traits' : playerTraits,
    'pace' : pace,
    'shooting' : shooting,
    'passing' : passing,
    'dribbling' : dribbling,
    'defending' : defending,
    'physic' : physic,
    'attacking_crossing' : attackingCrossing,
    'attacking_finishing' : attackingFinishing,
    'attacking_heading_accuracy' : attackingHeadingAccuracy,
    'attacking_short_passing' : attackingShortPassing,
    'attacking_volleys' : attackingVolleys,
    'skill_dribbling' : skillDribbling,
    'skill_curve' : skillCurve,
    'skill_fk_accuracy' : skillFkAccuracy,
    'skill_long_passing' : skillLongPassing,
    'skill_ball_control' : skillBallControl,
    'movement_acceleration' : movementAcceleration,
    'movement_sprint_speed' : movementSprintSpeed,
    'movement_agility' : movementAgility,
    'movement_reactions' : movementReactions,
    'movement_balance' : movementBalance,
    'power_shot_power' : powerShotPower,
    'power_jumping' : powerJumping,
    'power_stamina' : powerStamina,
    'power_strength' : powerStrength,
    'power_long_shots' : powerLongShots,
    'mentality_aggression' : mentalityAggression,
    'mentality_interceptions' : mentalityInterceptions,
    'mentality_positioning' : mentalityPositioning,
    'mentality_vision' : mentalityVision,
    'mentality_penalties' : mentalityPenalties,
    'mentality_composure' : mentalityComposure,
    'defending_marking_awareness' : defendingMarkingAwareness,
    'defending_standing_tackle' : defendingStandingTackle,
    'defending_sliding_tackle' : defendingSlidingTackle,
    'goalkeeping_diving' : goalkeepingDiving,
    'goalkeeping_handling' : goalkeepingHandling,
    'goalkeeping_kicking' : goalkeepingKicking,
    'goalkeeping_positioning' : goalkeepingPositioning,
    'goalkeeping_reflexes' : goalkeepingReflexes,
    'goalkeeping_speed' : goalkeepingSpeed,
    'ls' : ls,
    'st' : st,
    'rs' : rs,
    'lw' : lw,
    'lf' : lf,
    'cf' : cf,
    'rf' : rf,
    'rw' : rw,
    'player_face_url' : playerFaceUrl,
    'club_logo_url' : clubLogoUrl,
    'club_flag_url' : clubFlagUrl,
    'nation_logo_url' : nationLogoUrl,
    'nation_flag_url' : nationFlagUrl
  };
}