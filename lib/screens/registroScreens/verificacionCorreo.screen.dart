import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';
import 'package:spotter/screens/login.screen.dart';

class VerificacionCorreoScreen extends StatelessWidget {
  VerificacionCorreoScreen({super.key});

  final AutentificacionController _autentificacionController =
      Get.find<AutentificacionController>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_with_circle.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30),
              Text('¡Verifica tu correo!', style: Get.textTheme.bodyLarge),
              SizedBox(height: 10),
              Obx(() => Text(
                    '${_autentificacionController.email}',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Get.offNamed('/');
                  },
                  child: Text('Correo verificado'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 0),
                  )),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Cambiar correo electrónico',
                        titleStyle: Get.textTheme.displayLarge,
                        titlePadding:
                            EdgeInsets.only(top: 20, left: 20, right: 20),
                        content: Column(
                          children: [
                            TextField(
                              controller: _emailController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'nuevo@correo.com',
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: () async {
                                  bool isTrue = await _autentificacionController
                                      .cambiarEmail(_emailController.text);
                                  Get.back();
                                  if (!isTrue) {
                                    Get.offAll(LoginScreen(),
                                        binding: BindingsBuilder(() {
                                      Get.put(AutentificacionController());
                                    }), arguments: {
                                      'error':
                                          'No se ha podido cambiar el correo electrónico, tiene que inicar sesión de nuevo y volverlo a intentar'
                                    }); // TODO no sé como pasar el error a la pantalla de login, sin que me afecte a la pantalla de verificación de correo
                                  } else {
                                    Get.snackbar(
                                      'Correo cambiado',
                                      'Se ha cambiado el correo electrónico correctamente y enviado un correo de verificación a ${_autentificacionController.email}',
                                      duration: Duration(seconds: 5),
                                    );
                                  }
                                },
                                child: Text('Cambiar correo'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 0),
                                )),
                          ],
                        ));
                  },
                  child: Text('Cambiar correo'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 0),
                  )),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    _autentificacionController.enviarEmailVerificacion();
                    Get.snackbar(
                      'Correo enviado',
                      'Se ha enviado un correo de verificación a ${_autentificacionController.email}',
                      duration: Duration(seconds: 5),
                    );
                  },
                  child: Text('Volver a enviar correo de verificación'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 0),
                  )),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: '¿No has recibido el correo de verificación? ',
                  style: Get.textTheme.bodyMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Mira en spam',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.secondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
