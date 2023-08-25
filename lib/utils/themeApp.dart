import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color colorPrimario = Color(0xFFB81010);
Color colorPrimarioClaro = Color.fromARGB(255, 225, 225, 225);

ThemeData themeApp = ThemeData.light().copyWith(
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all<Color>(colorPrimario),
  ),
  dividerTheme: DividerThemeData(
    color: colorPrimario,
    thickness: 1,
    indent: 10.0,
    endIndent: 10.0,
  ),
  sliderTheme: SliderThemeData(
    disabledActiveTrackColor: colorPrimario,
    activeTrackColor: colorPrimario,
    inactiveTrackColor: colorPrimario.withOpacity(0.5),
    trackHeight: 4,
    thumbColor: colorPrimario,
    disabledThumbColor: colorPrimario,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
    overlayColor: colorPrimario.withOpacity(0.2),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
  ),
  primaryColor: colorPrimarioClaro,
  primaryColorDark: colorPrimario,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    centerTitle: false,
    foregroundColor: Colors.black,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    toolbarHeight: 100,
  ),
  textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Swis721',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Swis721',
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Swis721',
        fontSize: 14,
        fontWeight: FontWeight.w100,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Swis721',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Swis721',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Swis721',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      )),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Get.theme.colorScheme.error,
    actionTextColor: Get.theme.colorScheme.onError,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorPrimario,
      textStyle: TextStyle(
        fontFamily: 'Swis721',
        color: Colors.white,
        fontSize: 18,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    fillColor: colorPrimarioClaro,
    filled: true,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color>(colorPrimario),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.transparent,
    disabledColor: Colors.transparent,
    selectedColor: colorPrimario,
    labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    side: BorderSide(color: colorPrimarioClaro, width: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    labelStyle: TextStyle(
      fontFamily: 'Swis721',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    secondaryLabelStyle: TextStyle(
      fontFamily: 'Swis721',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: colorPrimario,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      fontFamily: 'Swis721',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: colorPrimario,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Swis721',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: colorPrimario,
    linearMinHeight: 3,
    circularTrackColor: colorPrimarioClaro,
    linearTrackColor: colorPrimarioClaro,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
);
