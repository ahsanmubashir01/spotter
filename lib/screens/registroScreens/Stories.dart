import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              StoryView(
                storyItems: [
                  StoryItem.pageImage(
                    url:
                        "https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2022/07/what-is-a-url.webp",
                    controller: controller,
                  ),
                  StoryItem.pageImage(
                    url:
                        "https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2022/07/what-is-a-url.webp",
                    controller: controller,
                  ),
                ],
                controller: controller,
                inline: false,
                repeat: false,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/photo (1).png"),
                        ),
                        SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        Text(
                          "FloraJones",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
SizedBox(width: 100,),
                        TextButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                backgroundColor: Colors.grey,
                                fixedSize: Size(20, 40)),
                            onPressed: () {},
                            child: Image.asset('assets/Vector (Stroke).png')),
                        SizedBox(width: 200,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 1.3),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 210,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white, blurRadius: 2.5),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.white)),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey,
                                hintText: 'Your message',
                                contentPadding: EdgeInsets.all(8),
                                suffixIcon: Image.asset('assets/sufix.png'),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 30,
                          ),
                          TextButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  backgroundColor: Colors.grey,
                                  fixedSize: Size(20, 40)),
                              onPressed: () {},
                              child: Image.asset('assets/send.png'))
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
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
