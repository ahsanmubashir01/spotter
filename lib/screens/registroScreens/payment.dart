import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotter/screens/registroScreens/matches.dart';
import 'package:spotter/screens/registroScreens/photofullscreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = -1; // Initialize with an invalid value

  void _handleRadioValueChanged(int value) {
    setState(() {
      selectedValue = value;
    });
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/icons/backarrow.svg'),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    child: Text(
                      '   Payment',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Matches()),
                    );},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 27, 0),
              child: Text(
                'Complete your payment to enjoy the most',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
              child: Text(
                'Saved payment options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _handleRadioValueChanged(1);
                    },
                    child: Container(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: selectedValue,
                              onChanged: (int? value) {
                                _handleRadioValueChanged(value!);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('HDFC Credit Card'),
                                  Text("*** *** *** 5229"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                              child: SvgPicture.asset(
                                  'assets/images/icons/master card icon.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _handleRadioValueChanged(2);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: selectedValue,
                                onChanged: (int? value) {
                                  _handleRadioValueChanged(value!);
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ICICI Credit Card'),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text('*** *** *** 1234'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(83, 20, 0, 0),
                                child: SvgPicture.asset(
                                    'assets/images/icons/visa icon.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Divider(
                thickness: 2,
                color: Color.fromRGBO(210, 210, 243, 1),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'UPI Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    'Linked',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Divider(
                thickness: 2,
                color: Color.fromRGBO(210, 210, 243, 1),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'PayTM / Walllets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Divider(
                thickness: 2,
                color: Color.fromRGBO(210, 210, 243, 1),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Net Banking',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Divider(
                thickness: 2,
                color: Color.fromRGBO(210, 210, 242, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset('assets/images/icons/add.svg'),
            Text(
              'Add New Payment Option',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(
                    184,
                    16,
                    16,
                    1,
                  )),
            ),
            SizedBox(
              height: 55,
            ),
            Container(
              width: 244,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoFullScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(184, 16, 16, 1),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
