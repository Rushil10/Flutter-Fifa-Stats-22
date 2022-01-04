import 'package:fifa_stats/db/configureDB.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:fifa_stats/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SetUpLocalDb extends StatefulWidget {
  const SetUpLocalDb({Key? key}) : super(key: key);

  @override
  _SetUpLocalDbState createState() => _SetUpLocalDbState();
}

class _SetUpLocalDbState extends State<SetUpLocalDb> {
  @override
  bool loading = true;
  double completed = 0;
  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    //checkingDb();
    checkSetUp();
  }

  void checkSetUp() async {
    var setUp = await storage.read(key: 'db');
    if (setUp == "done") {
      setState(() {
        loading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      setState(() {
        loading = false;
      });
      checkingDb();
    }
    print(setUp);
  }

  void checkingDb() async {
    bool created = await checkDbExists();
    if (created) {
      startSettingUpLocalDb();
    } else {
      setUpDb();
    }
  }

  void changeCompleted(int i) async {
    print(i / 19239);
    if (i == 19239) {
      storage.write(key: 'db', value: 'done');
      setState(() {
        loading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      return;
    }
    setState(() {
      completed = i / 19239;
    });
  }

  void startSettingUpLocalDb() async {
    var start = await PlayersDatabase.instance.getNumberOfRows();
    if (start == 19239) {
      storage.write(key: 'db', value: 'done');
      setState(() {
        completed = 1;
        loading = false;
      });
      return;
    } else {
      createListOfFields(start + 1, changeCompleted);
    }
  }

  void setUpDb() async {
    var created = await PlayersDatabase.instance.database;
    startSettingUpLocalDb();
    print(created);
  }

  String percent() {
    double p = completed * 100;
    int k = p.round();
    return k.toString();
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        body: !loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.all(15),
                      child: LinearProgressIndicator(
                        value: completed,
                        minHeight: 12.5,
                      )),
                  completed < 1
                      ? Text(
                          'Setting Up Players Database',
                          style: TextStyle(fontSize: 16),
                        )
                      : Text(
                          'Database Setup Completed',
                          style: TextStyle(fontSize: 16),
                        ),
                  Container(
                    height: 9,
                  ),
                  Text(percent() + ' % Completed',
                      style: TextStyle(fontSize: 16)),
                ],
              )
            : Center(
                child: Container(
                  width: 45,
                  height: 45,
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
