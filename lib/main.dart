import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'; // Import the package
import 'package:spotter/utils/AppTranslations.dart';
import 'package:spotter/utils/routes.dart';
import 'package:spotter/utils/themeApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('es', 'ES'),
      translations: AppTranslations(),
      debugShowCheckedModeBanner: false,
      title: 'Spotter',
      theme: themeApp,
      initialRoute: '/',
      getPages: routes,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(
            context, widget!), // Use BouncingScrollWrapper if needed
        maxWidth: 1200,
        minWidth: 300,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(300, name: MOBILE),
          ResponsiveBreakpoint.resize(500, name: MOBILE),
          ResponsiveBreakpoint.resize(700, name: TABLET),
          ResponsiveBreakpoint.resize(900, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: TABLET),
        ],
      ),
    );
  }
}
