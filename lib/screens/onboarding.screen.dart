import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  // ignore: unused_field
  final AutentificacionController _autentificacionController =
      Get.put(AutentificacionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                  child: Image.asset(
                    'assets/images/onboarding.jpeg',
                    fit: BoxFit.fitWidth,
                    height: 400,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              Text(
                'Descubre gente increíble de un solo golpe.',
                style: Get.theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'Explora las personas más interesantes a las que les gusta la gimnasia, según tus intereses y preferencias.',
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        Get.toNamed('/chat'), //call any screen   /exploreMain

                    child: Text('Registrate'),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () => Get.toNamed('/login', arguments: 'hola'),
                    child: Text('Iniciar sesión',
                        style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDAD5D5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
