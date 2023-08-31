import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/screens/exploreMain.screen.dart';
import 'package:spotter/screens/profile.screen.dart';
import 'package:spotter/screens/registroScreens/chat.dart';
import 'package:spotter/screens/registroScreens/likes.dart';
import 'package:spotter/screens/registroScreens/matches.dart';
import 'package:spotter/screens/registroScreens/messagelist.dart';
import 'package:spotter/screens/registroScreens/profile.dart';
import 'package:spotter/screens/widgets/filtroExploreMainScreen.dart';
import '../controllers/usuario.controller.dart';
import 'listLikes.screen.dart';
import 'listMatches.screen.dart';
import 'widgets/stylePageSesions.dart';

class LogicaBottomNavigatorBarScreen extends StatefulWidget {
  const LogicaBottomNavigatorBarScreen({super.key});

  @override
  State<LogicaBottomNavigatorBarScreen> createState() =>
      _LogicaBottomNavigatorBarScreenState();
}

class _LogicaBottomNavigatorBarScreenState
    extends State<LogicaBottomNavigatorBarScreen> {
  int _selectedIndex = 0;
  final UsuarioController usuarioController = Get.put(UsuarioController());

  static List<Widget> _widgetOptions = <Widget>[
    ExploreMainScreen(),
    // Matches(),
    HomePage(),
    MessageList(),
    Fitness(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
