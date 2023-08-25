import 'package:flutter/material.dart';
import 'package:get/get.dart';

ButtonStyle styleSocial = ElevatedButton.styleFrom(
  alignment: Alignment.center,
  backgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  textStyle: TextStyle(
    fontFamily: 'Swis721',
    color: Colors.white,
    fontSize: 18,
  ),
  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Get.theme.primaryColor)),
);

ButtonStyle styleButtonBack = ButtonStyle(
  padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(horizontal: 1, vertical: 20)),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Get.theme.primaryColor)),
  ),
);

AppBar appBarSpotterRegister(double? step) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 15,
          ),
          style: styleButtonBack,
        ),
        SizedBox(height: 20),
        step != -1
            ? Slider(
                value: step! / 9,
                onChanged: null,
                activeColor: Get.theme.primaryColorDark,
              )
            : SizedBox(height: 0),
      ],
    ),
  );
}
