import 'package:flutter/material.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  DateTime? _selectedDate;

  final List<Map<String, dynamic>> _countries = [
    {
      'value': 'us',
      'label': 'English',
      'icon': Image.asset('assets/United States of America (US).png')
    },
    {
      'value': 'ca',
      'label': 'Russian',
      'icon': Image.asset('assets/United States of America (US).png')
    },
    // Add more countries with their values and labels
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fixedSize: Size(40, 40)),
                      onPressed: () {},
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.red,
                      )),
                ),
                SizedBox(width: 40),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Camera logic here
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue,
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Image.asset('assets/profile image.png'),
              ElevatedButton(
                onPressed: () {
                  // Edit logic here
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.red,
                ),
                child: Image.asset(
                  'assets/edit-2.png',
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text('AdamsRoyale'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    'Profile Setting',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Personal Info   ',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.white)),
                      // filled: true,
                      // fillColor: Colors.black,
                      hintText: 'Adams Royale',
                      hintStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.white), // Set the border side color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Mobile Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.white)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '+929343345540',
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.white), // Set the border side color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.white)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'AdamsRoyale@hotmail.com',
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.white), // Set the border side color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Date of Birth',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: TextEditingController(
                      text: _selectedDate != null
                          ? "${_selectedDate?.day}-${_selectedDate?.month}-${_selectedDate?.year}"
                          : "",
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime initialDate = _selectedDate ?? DateTime.now();
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              // Change the background color here
                              primaryColor: Colors
                                  .blue, // Change this to your desired color
                              colorScheme:
                                  ColorScheme.light(primary: Colors.blue),
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blue)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '31-JAN-2000',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.white), // Set the border side color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Plan Setting',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Date of birth',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.white)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Free',
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/arrow-down.png')),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.white), // Set the border side color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Discovery location',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'location',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'My current location',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      // Adjust padding as needed
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Houston, Texas'),
                          SizedBox(width: 5),
                          // Add some spacing between text and icon
                          IconButton(
                            onPressed: () {
                              // Your dropdown button logic here
                            },
                            icon: Image.asset('assets/location.png'),
                            color: Colors.red,
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Preferred Language',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: 'us', // Initial value
                      onChanged: (value) {
                        // Handle dropdown value change
                      },
                      items: _countries.map((Map<String, dynamic> country) {
                        return DropdownMenuItem<String>(
                          value: country['value'],
                          child: Row(
                            children: [
                              country['icon'], // Use the image icon
                              SizedBox(width: 10),
                              Text(
                                country['label'],
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Fitness Record',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Deadlift',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Squat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bench-press',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeightDropDownButton(),
                  WeightDropDownButton(),
                  WeightDropDownButton(),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Duration',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Volume',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Level',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DurationDropDownButton(),
                  WeightDropDownButton(),
                  LevelDropDownButton(),
                ],
              ),
            ]),
          )
        ])));
  }
}

class WeightDropDownButton extends StatefulWidget {
  @override
  _WeightDropDownButtonState createState() => _WeightDropDownButtonState();
}

class _WeightDropDownButtonState extends State<WeightDropDownButton> {
  String selectedWeight = '100KG';

  List<String> weights = ['100KG', '80KG', '60KG', '40KG'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80, // Adjust the width as needed
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                  // Apply decoration here
                  ),
              child: DropdownButton<String>(
                value: selectedWeight,
                onChanged: (newValue) {
                  setState(() {
                    selectedWeight = newValue!;
                  });
                },
                hint: Text(selectedWeight),
                items: weights
                    .map<DropdownMenuItem<String>>(
                      (String weight) => DropdownMenuItem<String>(
                        value: weight,
                        child: Row(
                          children: [
                            Text(
                              weight,
                              style: TextStyle(color: Colors.black),
                            ),
                            // SizedBox(width: 5),
                            // Image.asset(
                            //   'assets/arrow-down.png',
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class DurationDropDownButton extends StatefulWidget {
  const DurationDropDownButton({Key? key}) : super(key: key);

  @override
  State<DurationDropDownButton> createState() => _DurationDropDownButtonState();
}

class _DurationDropDownButtonState extends State<DurationDropDownButton> {
  String selectedyear = '1 year';

  List<String> years = ['1 year', '2 year', '3 year', '4 year'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80, // Adjust the width as needed
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                  // Apply decoration here
                  ),
              child: DropdownButton<String>(
                value: selectedyear,
                onChanged: (newValue) {
                  setState(() {
                    selectedyear = newValue!;
                  });
                },
                hint: Text(selectedyear),
                items: years
                    .map<DropdownMenuItem<String>>(
                      (String weight) => DropdownMenuItem<String>(
                        value: weight,
                        child: Row(
                          children: [
                            Text(
                              weight,
                              style: TextStyle(color: Colors.black),
                            ),
                            // SizedBox(width: 5),
                            // Image.asset(
                            //   'assets/arrow-down.png',
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class LevelDropDownButton extends StatefulWidget {
  const LevelDropDownButton({Key? key}) : super(key: key);

  @override
  State<LevelDropDownButton> createState() => _LevelDropDownButtonState();
}

class _LevelDropDownButtonState extends State<LevelDropDownButton> {
  String selectedLevel = 'Elite';

  List<String> levels = ['Elite', 'Mars', 'Ritter', 'lindt'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80, // Adjust the width as needed
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                  // Apply decoration here
                  ),
              child: DropdownButton<String>(
                value: selectedLevel,
                onChanged: (newValue) {
                  setState(() {
                    selectedLevel = newValue!;
                  });
                },
                hint: Text(selectedLevel),
                items: levels
                    .map<DropdownMenuItem<String>>(
                      (String level) => DropdownMenuItem<String>(
                        value: level,
                        child: Row(
                          children: [
                            Text(
                              level,
                              style: TextStyle(color: Colors.black),
                            ),
                            // SizedBox(width: 5),
                            // Image.asset(
                            //   'assets/arrow-down.png',
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
