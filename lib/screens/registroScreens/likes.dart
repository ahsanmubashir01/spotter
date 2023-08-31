import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:spotter/screens/registroScreens/chat.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 60, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/icons/backarrow.svg'),
                  SizedBox(width: 50),
                  InkWell(
                    child: Text(
                      '   Matches',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 65),
                  SvgPicture.asset(
                    'assets/images/icons/gridview.svg',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TabBar(
              labelColor: Colors.black,
              indicatorColor: Color.fromRGBO(184, 16, 16, 1),
              tabs: [
                Tab(
                  text: "Who likes me",
                ),
                Tab(
                  text: "My history",
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        _buildSwiperContent(_onSwipe),
                        SizedBox(height: 10),
                        Text(
                          'Give them a reason\nto notice you',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'People who like you will appear here.\nBrush up your profile to attract more likes.',
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 280,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your button click functionality here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(184, 16, 16, 1),
                            ),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _buildSwiperContent(_onSwipe1),
                        SizedBox(height: 20),
                        Text(
                          "Let's get you matched!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Once you start swiping, all your actions will\nappear here.',
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        Container(
                          width: 280,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(184, 16, 16, 1),
                            ),
                            child: Text(
                              'Start Swiping',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwiperContent(
      bool Function(int, int?, CardSwiperDirection) onSwipe) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 0, 0, 0),
      child: Container(
        height: 280,
        child: CardSwiper(
          cardsCount: 3,
          onSwipe: onSwipe,
          cardBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Image.asset(
                'assets/images/fit.png',fit: BoxFit.cover,
                height: 150,
                width: 200,

              ),
            ),
          ),

        ),

      ),

    );

  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    // Handle swipe action here
    print('Swiped card at index $currentIndex to ${direction.name}');
    return true;
  }

  bool _onSwipe1(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    // Handle swipe action here
    print('Swiped card at index $currentIndex to ${direction.name}');
    return true;
  }
}
