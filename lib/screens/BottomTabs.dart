import 'package:fifa_stats/screens/HomeScreen.dart';
import 'package:fifa_stats/screens/SearchScreen.dart';
import 'package:fifa_stats/utlis/CustomColors.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _widgetOptions.elementAt(_selectedIndex),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sports_soccer_rounded,
            ),
            label: 'Top 200 Players',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: posColor,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
