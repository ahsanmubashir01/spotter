import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';

class ChatNew extends StatefulWidget {
  const ChatNew({super.key});

  @override
  State<ChatNew> createState() => _ChatNewState();
}

class _ChatNewState extends State<ChatNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              18,
              60,
              0,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/icons/backarrow.svg'),
                SizedBox(
                  width: 50,
                ),
                InkWell(
                  child: Text(
                    '   Matches',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // onTap: (){Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Matches()),
                  // );},
                ),
                SizedBox(
                  width: 65,
                ),
                SvgPicture.asset(
                  'assets/images/icons/gridview.svg',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 350, // Set a specific height for the CardSwiper
            padding: const EdgeInsets.only(left: 30),
            child: CardSwiper(
              cardsCount: 3, // Set the number of cards
              onSwipe: _onSwipe3, // Handle swipe
              cardBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  // Replace with your image URLs
                  'assets/images/fit.png',
                  height: 300,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Match to chat",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Once you're mutually matched with someone.\nyou'll will be connected automatically.\nMessages,voice call and video chats\nare totally free.",
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26,
          ),
          Container(
            width: 280,
            child: ElevatedButton(
              onPressed: () {
                // Add your button click functionality here
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(184, 16, 16, 1), // Set background color
              ),
              child: Text(
                'Start Swiping',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe3(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    // Handle swipe action here
    print('Swiped card at index $currentIndex to ${direction.name}');
    return true;
  }
}
