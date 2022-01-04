import 'dart:ffi';

import 'package:fifa_stats/db/Player.dart';
import 'package:path/path.dart';
import 'package:sqflite/src/factory_impl.dart' show databaseFactory;
import 'package:sqflite/sqflite.dart';

class PlayersDatabase {
  static final PlayersDatabase instance = PlayersDatabase._init();

  static Database? _database;

  PlayersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('players22.db');
    return _database!;
  }

  Future deleteDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'players22.db');

// Delete the database
    await deleteDatabase(path);
    print("Deleted Database");
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> dropTable() async {
    final db = await instance.database;
    await db.execute('DROP TABLE IF EXISTS players');
    print('DATABASE DELETED');
  }

  void checkIfDBCreated() async {
    //var created = PlayersDatabase.instance.database;
    //await PlayersDatabase.instance.deleteDB();
    var created = await PlayersDatabase.instance.database;
    print(created);
    //PlayersDatabase.instance.dropTable();
    //createListOfFields();
    //readDB();
  }

  Future<bool> checkDbExists() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'players22.db');
    return databaseFactory.databaseExists(path);
  }

  Future<void> readDb() async {
    final db = await instance.database;
    List<Map> li = await db.query('players');
    print(li.length);
  }

  Future getNumberOfRows() async {
    final db = await instance.database;
    List<Map> li = await db.rawQuery('SELECT id from players');
    return li.length;
  }

  Future top100Players() async {
    final db = await instance.database;
    List<Map> li = await db.rawQuery(
        'SELECT id,sofifa_id,player_url,player_positions,short_name,potential,age,overall,club_name,player_face_url FROM players LIMIT 200');
    return li;
  }

  Future getPlayerDetails(var id) async {
    final db = await instance.database;
    List<Map> li = await db.rawQuery('''
    SELECT * FROM players WHERE id=${id};
    ''');
    return li;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE players (
        id INTEGER PRIMARY KEY,
        sofifa_id DECIMAL NOT NULL,
        player_url VARCHAR NOT NULL,
        short_name VARCHAR NOT NULL,
        long_name VARCHAR NOT NULL,
        player_positions VARCHAR NOT NULL,
        overall DECIMAL NOT NULL,
        potential DECIMAL NOT NULL,
        value_eur DECIMAL,
        wage_eur DECIMAL,
        age DECIMAL NOT NULL,
        dob DATE NOT NULL,
        height_cm DECIMAL NOT NULL,
        weight_kg DECIMAL NOT NULL,
        club_team_id DECIMAL,
        club_name VARCHAR,
        league_name VARCHAR,
        league_level DECIMAL,
        club_position VARCHAR,
        club_jersey_number DECIMAL,
        club_loaned_from VARCHAR,
        club_joined DATE,
        club_contract_valid_until DECIMAL,
        nationality_id DECIMAL NOT NULL,
        nationality_name VARCHAR NOT NULL,
        nation_team_id DECIMAL,
        nation_position VARCHAR,
        nation_jersey_number DECIMAL,
        preferred_foot VARCHAR NOT NULL,
        weak_foot DECIMAL NOT NULL,
        skill_moves DECIMAL NOT NULL,
        international_reputation DECIMAL NOT NULL,
        work_rate VARCHAR NOT NULL,
        body_type VARCHAR NOT NULL,
        real_face BOOLEAN NOT NULL,
        release_clause_eur DECIMAL,
        player_tags VARCHAR,
        player_traits VARCHAR,
        pace DECIMAL,
        shooting DECIMAL,
        passing DECIMAL,
        dribbling DECIMAL,
        defending DECIMAL,
        physic DECIMAL,
        attacking_crossing DECIMAL NOT NULL,
        attacking_finishing DECIMAL NOT NULL,
        attacking_heading_accuracy DECIMAL NOT NULL,
        attacking_short_passing DECIMAL NOT NULL,
        attacking_volleys DECIMAL NOT NULL,
        skill_dribbling DECIMAL NOT NULL,
        skill_curve DECIMAL NOT NULL,
        skill_fk_accuracy DECIMAL NOT NULL,
        skill_long_passing DECIMAL NOT NULL,
        skill_ball_control DECIMAL NOT NULL,
        movement_acceleration DECIMAL NOT NULL,
        movement_sprint_speed DECIMAL NOT NULL,
        movement_agility DECIMAL NOT NULL,
        movement_reactions DECIMAL NOT NULL,
        movement_balance DECIMAL NOT NULL,
        power_shot_power DECIMAL NOT NULL,
        power_jumping DECIMAL NOT NULL,
        power_stamina DECIMAL NOT NULL,
        power_strength DECIMAL NOT NULL,
        power_long_shots DECIMAL NOT NULL,
        mentality_aggression DECIMAL NOT NULL,
        mentality_interceptions DECIMAL NOT NULL,
        mentality_positioning DECIMAL NOT NULL,
        mentality_vision DECIMAL NOT NULL,
        mentality_penalties DECIMAL NOT NULL,
        mentality_composure DECIMAL NOT NULL,
        defending_marking_awareness DECIMAL NOT NULL,
        defending_standing_tackle DECIMAL NOT NULL,
        defending_sliding_tackle DECIMAL NOT NULL,
        goalkeeping_diving DECIMAL NOT NULL,
        goalkeeping_handling DECIMAL NOT NULL,
        goalkeeping_kicking DECIMAL NOT NULL,
        goalkeeping_positioning DECIMAL NOT NULL,
        goalkeeping_reflexes DECIMAL NOT NULL,
        goalkeeping_speed DECIMAL,
        ls VARCHAR NOT NULL,
        st VARCHAR NOT NULL,
        rs VARCHAR NOT NULL,
        lw VARCHAR NOT NULL,
        lf VARCHAR NOT NULL,
        cf VARCHAR NOT NULL,
        rf VARCHAR NOT NULL,
        rw VARCHAR NOT NULL,
        club_flag_url VARCHAR,
        player_face_url VARCHAR,
        club_logo_url VARCHAR,
        nation_logo_url VARCHAR,
        nation_flag_url VARCHAR NOT NULL
)
''');
    print("Tabel Created");
  }

  Future insertPlayer(Player player) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert("players", player.toJson());
    print("Inserted in db players");
  }
}
