import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';

import 'widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AutentificacionController _autentificacionController =
      Get.put(AutentificacionController());
  bool _mostrarContrasenya = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _cargando = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo_with_circle.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30),
              Text('¡Hola de nuevo!', style: Get.textTheme.bodyLarge),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.black),
                  obscureText: !_mostrarContrasenya,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    suffixIcon: IconButton(
                      enableFeedback: false,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        _mostrarContrasenya
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _mostrarContrasenya = !_mostrarContrasenya;
                        Get.forceAppUpdate();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Visibility(
                      visible: _cargando,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        onPressed: () async {
                          // TODO Recuperar contraseña, No se puede cambiar la contraseña si no verifica que el correo es suyo, hay que mirar como hacer esto
                          _cargando = true;
                          bool isReset = await _autentificacionController
                              .cambiarPassword(_emailController.text);
                          if (isReset) {
                            Get.snackbar(
                              'Contraseña cambiada',
                              'Se ha enviado un correo electrónico para cambiar la contraseña',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Get.theme.colorScheme.secondary,
                              colorText: Get.theme.colorScheme.onSecondary,
                            );
                          } else {
                            Get.snackbar(
                              'Error',
                              'No se ha podido enviar el correo electrónico para cambiar la contraseña',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Get.theme.colorScheme.error,
                              colorText: Get.theme.colorScheme.onError,
                            );
                          }
                          _cargando = false;
                        },
                        child: Text('¿Olvidaste tu contraseña?',
                            style: Get.textTheme.bodySmall),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0) +
                    const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      Get.offNamed('/name');

                      bool isLogin = await _autentificacionController.login(
                          _emailController.text, _passwordController.text);
                      if (isLogin) {
                      } else {
                        Get.snackbar(
                          'Error',
                          'No se ha podido iniciar sesión, comprueba que el correo electrónico y la contraseña son correctos',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Get.theme.colorScheme.error,
                          colorText: Get.theme.colorScheme.onError,
                        );
                      }
                    },
                    child: Text('Iniciar sesión'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 0),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.black,
                  ),
                  Text('   O Continúa con   ', style: Get.textTheme.bodySmall),
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: styleSocial,
                        child: Image.asset('assets/images/facebook.png',
                            width: 30, height: 30)),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: styleSocial,
                        child: Image.asset('assets/images/google.png',
                            width: 30, height: 30)),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: styleSocial,
                        child: Image.asset('assets/images/apple.png',
                            width: 30, height: 30)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Get.toNamed('/register'),
                child: Text('¿No tienes cuenta? Registrate ahora',
                    style: Get.textTheme.bodySmall),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () => Get.toNamed('/terms'),
                    child: Text('Términos y condiciones',
                        style: Get.textTheme.bodySmall),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => Get.toNamed('/privacy'),
                    child: Text('Política de privacidad',
                        style: Get.textTheme.bodySmall),
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
