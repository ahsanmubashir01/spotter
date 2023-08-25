import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';
import 'package:spotter/screens/registroScreens/verificacionCorreo.screen.dart';

import 'logicaBottomNavigatorBar.screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final AutentificacionController _autentificacionController =
      Get.put(AutentificacionController());

// TODO Error: si tengo una sesion iniciada y borro la cuenta de firebase, al iniciar la app se queda en el splash screen y no se puede hacer nada
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/back_splash.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.8),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            FutureBuilder(
                future: _autentificacionController.init(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error al cargar con la base de datos',
                        style: Get.textTheme.displayMedium);
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      if (_autentificacionController.isOnline) {
                        if (!_autentificacionController.loggedIn) {
                          Get.offAllNamed('/onboarding');
                        } else {
                          _autentificacionController.emailVerified
                              ? Get.offAll(LogicaBottomNavigatorBarScreen(),
                                  binding: BindingsBuilder(() {
                                  Get.put(AutentificacionController());
                                }))
                              : Get.offAll(VerificacionCorreoScreen(),
                                  binding: BindingsBuilder(() {
                                  Get.put(AutentificacionController());
                                }));
                        }
                      }
                    });

                    return Visibility(
                      visible: !_autentificacionController.isOnline,
                      child: Column(
                        children: [
                          Text('No hay conexión a internet',
                              style: Get.textTheme.displayMedium),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Get.off(SplashScreen());
                            },
                            child: Text('Recargar',
                                style: Get.textTheme.displayMedium),
                          )
                        ],
                      ),
                    );
                  }

                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  );
                }),
          ],
        ),
      ],
    );
  }
}
