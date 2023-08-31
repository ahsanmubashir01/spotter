import 'package:flutter/material.dart';
import 'package:spotter/screens/registroScreens/subscription.dart';

class SubscriptionOptingMessage extends StatefulWidget {
  const SubscriptionOptingMessage({Key? key}) : super(key: key);

  @override
  State<SubscriptionOptingMessage> createState() =>
      _SubscriptionOptingMessageState();
}

class _SubscriptionOptingMessageState extends State<SubscriptionOptingMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.2, 35, 0.2, 0),
                child: Stack(
                  children: [
                    Image.asset('assets/images/opting.png'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
                      child: Center(
                          child: Image.asset(
                        'assets/images/logo_with_circle.png',
                        width: 130,
                        height: 130,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Hello User',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20), // Equal spacing from both sides
                child: Text(
                  'To continue with this option, please choose a subscription plan that suits you & get the most out of the app',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: 244,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Subscription()),
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
            ],
          ),
        ),
      ),
    );
  }
}
