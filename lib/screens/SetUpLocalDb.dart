import 'package:fifa_stats/ads/BannerAdSmall.dart';
import 'package:fifa_stats/db/configureDB.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:fifa_stats/screens/BottomTabs.dart';
import 'package:fifa_stats/screens/HomeScreen.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomTabs()),
          (Route<dynamic> route) => false);
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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomTabs()),
          (Route<dynamic> route) => false);
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
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: !loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Player Stats 22',
                                  style: TextStyle(
                                    color: posColor,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                ),
                                Text(
                                  'Storing Over 20000 Players',
                                  style: TextStyle(
                                    color: posColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(15),
                            child: LinearProgressIndicator(
                              value: completed,
                              minHeight: 12.5,
                              color: posColor,
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
                        Container(
                          height: 25,
                        ),
                        Text(
                          'App will Work Offline as well',
                          style: TextStyle(
                            color: posColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
                    BannerSmallAd(),
                  ],
                )
              : Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: CircularProgressIndicator(
                      color: posColor,
                    ),
                  ),
                )),
    );
  }
}
