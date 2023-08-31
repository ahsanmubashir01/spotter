import 'package:flutter/material.dart';

import '../exploreMain.screen.dart';
import '../listLikes.screen.dart';
import '../profile.screen.dart';
import 'likes.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ExploreMainScreen(),
    HomePage(),
    ListLikesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Screen 4',
          ),
        ],
      ),
    );
  }
}






