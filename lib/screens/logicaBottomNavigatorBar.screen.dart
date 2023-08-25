import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/screens/exploreMain.screen.dart';
import 'package:spotter/screens/profile.screen.dart';
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

  final namePages = [
    'Descubriendo',
    'Matches',
    'Me gusta',
    'Perfil',
  ];

  static List<Widget> _widgetOptions = <Widget>[
    ExploreMainScreen(),
    ListMatchesScreen(),
    ListLikesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(_selectedIndex),
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
            icon: Icon(Icons.star),
            label: 'Me gusta',
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

  AppBar AppBarMain(int index) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: index == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(namePages[index], style: Get.textTheme.bodyLarge),
                      //Text('Discover new places', style: Get.textTheme.bodySmall)
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        ContentBottomSheetFilter(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        enableDrag: false,
                        isScrollControlled: true,
                      );
                    },
                    child: Image.asset(
                      'assets/images/icons/filter_icon.png',
                      width: 20,
                    ),
                    style: styleButtonBack,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo_with_circle.png',
                        height: 56.0,
                      ),
                      SizedBox(width: 10),
                      Text(namePages[index], style: Get.textTheme.bodyLarge),
                      //Text('Discover new places', style: Get.textTheme.bodySmall)
                    ],
                  ),
                ],
              ));
  }
}
