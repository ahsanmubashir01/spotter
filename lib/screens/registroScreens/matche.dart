import 'package:flutter/material.dart';

import 'Stories.dart';

class MatchApp extends StatefulWidget {
  const MatchApp({Key? key}) : super(key: key);

  @override
  State<MatchApp> createState() => _MatchAppState();
}

class _MatchAppState extends State<MatchApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/images/photos.png'),
          Text(
            "It's a match, Adam!",
            style: TextStyle(
                color: Color(0xffB81010),
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
          Text('Start a conversation now with each other     ',style: TextStyle(fontSize: 12),),
          SizedBox(height: 40,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: const Color(0XFFB81010),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const Story()
                //     )
                // );
              },
              child: const Text(
                'Say Hello',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor:  Color(0xffffb6c1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const Story()
                //     )
                // );
              },
              child: const Text(
                'keep Swiping',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
        ]),
      ),
    );
  }
}
