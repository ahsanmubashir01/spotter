import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/appbarwidget.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  final double itemHeight = 190.0; // Height of each grid item
  final int crossAxisCount = 2; // Number of columns in the GridView
  int itemCount = 8; // Number of items in the GridView

  double calculateContainerHeight() {
    return ((itemCount / crossAxisCount).ceil()) * itemHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        Padding(
        padding: const EdgeInsets.fromLTRB(
          18,
          60,
          0,
          0,
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/icons/backarrow.svg'),
            SizedBox(
              width: 70,
            ),
            Text(
              'Matches',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 70,
            ),
            SvgPicture.asset(
              'assets/images/icons/gridview.svg',
              width: 50,
            ),
          ],
        ),
      ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                  'This is the list of people who have liked you and your matches.'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text('Today'),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: calculateContainerHeight(),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: itemCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                itemBuilder: (context, index) {
                  return griditem(); // Pass the index to your grid item widget
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Text('Yesterday'),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  0,
                  10,
                  0,
                ),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4, // Set the number of items in the GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the GridView
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Stack(
                            children: [
                              Container(
                                height: 190,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/back_splash.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  90,
                                  0,
                                  0,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 50, 0),
                                      child: Text(
                                        'Sophia, 21',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: SvgPicture.asset(
                                                'assets/images/icons/cross.svg'),
                                          ),
                                          SizedBox(width: 20),
                                          SvgPicture.asset(
                                              'assets/images/icons/heart.svg'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget griditem() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: SizedBox(
          height: 120,
          width: 120,
          child: Stack(
            children: [
              Container(
                height: itemHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/back_splash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  90,
                  0,
                  0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                      child: Text(
                        'Sophia, 21',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: SvgPicture.asset(
                                'assets/images/icons/cross.svg'),
                          ),
                          SizedBox(width: 20),
                          SvgPicture.asset('assets/images/icons/heart.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
