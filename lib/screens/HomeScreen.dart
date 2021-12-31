import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:fifa_stats/components/playerCard.dart';
import 'package:fifa_stats/db/Player.dart';
import 'package:fifa_stats/db/configureDB.dart';
import 'package:fifa_stats/db/players22.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  var loading = true;
  var players = [];

  void initState() {
    super.initState();
    getTop100PlayerData();
    //setUpDb();
  }

  void setUpDb() async {
    var created = await PlayersDatabase.instance.database;
    print(created);
    createListOfFields();
  }

  Future getTop100PlayerData() async {
    setState(() {
      loading = true;
    });
    var top100Players = await PlayersDatabase.instance.top100Players();
    print(top100Players.length);
    setState(() {
      players = top100Players;
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Fifa Stats"),
        ),
        body: !loading
            ? Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: queryData.size.width * 0.12,
                          alignment: Alignment.center,
                          child: Text(
                            'OVR',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Container(
                          width: queryData.size.width * 0.12,
                          alignment: Alignment.center,
                          child: Text(
                            'POT',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Container(
                          width: queryData.size.width * 0.12,
                          alignment: Alignment.center,
                          child: Text(
                            'AGE',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: players.length,
                          itemBuilder: (context, index) {
                            return PlayerCard(
                              playerData: players[index],
                            );
                          }))
                ],
              )
            : Center(
                child: Text('Loading'),
              ));
  }
}
