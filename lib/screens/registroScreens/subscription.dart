import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:spotter/screens/registroScreens/payment.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
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
                  Text(
                    ' Plan Setting',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
              child: Text(
                'For Best Access',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Color.fromRGBO(
                      184,
                      16,
                      16,
                      1,
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                  child: Text('Subscribe a plan'),
                ),
                SizedBox(
                  width: 13,
                ),
                SvgPicture.asset('assets/images/icons/love icon.svg'),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
              child: Text(
                'Top features you will get',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(184, 16, 16, 1),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('See whp likes you'),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(184, 16, 16, 1),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('No Ads'),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 0, 0, 0),
              child: Stack(
                children: [
                  Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(184, 16, 16, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: ExpandableText(
                      '       Browse profile invisily &.Atvero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                      expandText: 'Many more',
                      collapseText: 'show less',
                      maxLines: 1,
                      linkColor: Color.fromRGBO(184, 16, 16, 1),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 140, 0),
              child: Text(
                'Select your Plan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: 310,
              decoration: BoxDecoration(
                color:
                    Colors.white, // Change this to the desired background color
                borderRadius: BorderRadius.circular(
                    20), // Adjust the radius for rounded corners
                border: Border.all(
                  color: Colors.black26, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/images/icons/star.svg'),
                    Column(
                      children: [
                        Text(
                          'Spotter Free',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                          child: Text('3 Months'),
                        ),
                      ],
                    ),
                    Text(
                      '\$33.00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(184, 16, 16, 1)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: 310,
              decoration: BoxDecoration(
                color: Color.fromRGBO(184, 16, 16,
                    0.2), // Change this to the desired background color
                borderRadius: BorderRadius.circular(
                    20), // Adjust the radius for rounded corners
                border: Border.all(
                  color: Colors.black26, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/images/icons/diamond.svg'),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                          child: Text(
                            'Pro spotter',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                          child: Text('6 Months'),
                        ),
                      ],
                    ),
                    Text(
                      '\$60.00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(184, 16, 16, 1)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              width: 244,
              height: 56,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
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
