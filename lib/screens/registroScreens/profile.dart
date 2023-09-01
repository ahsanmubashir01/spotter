import 'package:flutter/material.dart';

class Food {
  final String name;

  Food(this.name);
}

class Fitness extends StatefulWidget {
  const Fitness({Key? key}) : super(key: key);

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/photo (2).png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1, // Initial size when collapsed
            minChildSize: 0.1, // Minimum size when fully expanded
            maxChildSize: 0.8, // Maximum size when fully expanded
            builder: (context, controller) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              child: ListView.builder(
                controller: controller,
                itemCount: 1, // Example itemCount
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50, // Adjust the width as needed
                                height: 50, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Image.asset('assets/close-small.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 70, // Adjust the width as needed
                                height: 70, // Adjust the height as needed
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {},
                                  child: Image.asset('assets/like.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 50, // Adjust the width as needed
                                height: 50, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Image.asset('assets/star.png'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Adams Royale, 25',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              Container(
                                width: 50, // Adjust the width as needed
                                height: 50, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Image.asset('assets/snd.png'),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Professional model',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              Container(
                                width: 80, // Adjust the width as needed
                                height: 30, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Image.asset('assets/location.png',
                                          color: Colors.red),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '1 km',
                                        style: TextStyle(color: Color.fromRGBO(223,64,187,1)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Houston, Texas,United States',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'About',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "i'm Adams Royale,a Professional model,fitness enthusiasts.i am passionate about keeping fit and living a healthy lifestyle.Weight and Cardio are my favorities.Started my Fitness journey about 6 years ago.",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Read more',
                              style: TextStyle(color: Color.fromRGBO(184,16,16,1)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Fitness journey:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Discipline:',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Cardio',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Current Phase:',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Maintaining',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Duration:',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('6 Years',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Current Gym:',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Fit Athletic Club.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '1532 West Gray Street,Houston,Texas 77019',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Personal Record:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Deadlift",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Squat',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              Text('Bench Press',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 75, // Adjust the width as needed
                                height: 33, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(237, 235, 235, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      '75kg',
                                      style: TextStyle(
                                          color: Color.fromRGBO(184,16,16,1), fontSize: 13),
                                    )),
                              ),
                              Container(
                                width: 75, // Adjust the width as needed
                                height: 33, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(237, 235, 235, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      '750kg',
                                      style: TextStyle(
                                          color: Color.fromRGBO(184,16,16,1), fontSize: 13),
                                    )),
                              ),
                              Container(
                                width: 75, // Adjust the width as needed
                                height: 33, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(237, 235, 235, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      '265.54kg',
                                      style: TextStyle(
                                          color: Color.fromRGBO(184,16,16,1), fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'looking For',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 90, // Adjust the width as needed
                                height: 40, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Gymbros',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    )),
                              ),
                              Container(
                                width: 90, // Adjust the width as needed
                                height: 40, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Meet Outside',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    )),
                              ),
                              Container(
                                width: 88, // Adjust the width as needed
                                height: 40, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Casual Spotter',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Interests',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Image.asset('assets/health.png'),
                                      SizedBox(width: 1),
                                      Text(
                                        'Powerlifting',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 10), // Add spacing between the buttons

                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Image.asset('assets/tennis.png'),
                                      SizedBox(width: 5),
                                      Text(
                                        'Sport',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 10), // Add spacing between the buttons

                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Image.asset(
                                          'assets/video-horizontal.png'),
                                      SizedBox(width: 5),
                                      Text(
                                        'Movies',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Image.asset('assets/ripple.png'),
                                      SizedBox(width: 5),
                                      Text(
                                        'swimming',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 10), // Add spacing between the buttons

                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(width: 12),
                                      Image.asset(
                                          'assets/Vector (Stroke) (1).png'),
                                      SizedBox(width: 5),
                                      Text(
                                        'Yoga',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 10), // Add spacing between the buttons

                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 2)
                                  ],
                                  color: Color.fromRGBO(253, 224, 224, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Image.asset(
                                          'assets/Vector (Stroke) (2).png'),
                                      SizedBox(width: 5),
                                      Text(
                                        'Hiking',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gallery',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  10,
                                  0,
                                ),
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(223,64,87,1)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Image.asset('assets/photo1.png'),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/photo 2.png'),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/photo 3.png'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
