import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';

import 'widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  bool _mostrarContrasenya = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$');

  final AutentificacionController _autentificacionController =
      Get.find<AutentificacionController>();

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
              Text('¡Bienvenido/a a SPOTTER!', style: Get.textTheme.bodyLarge),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _confirmPasswordController,
                  style: TextStyle(color: Colors.black),
                  obscureText: !_mostrarContrasenya,
                  decoration: InputDecoration(
                    hintText: 'Confirmar Contraseña',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'Al hacer clic en "Registrase", acepto ',
                    style: TextStyle(
                      fontFamily: 'Swis721',
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black26,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Condiciones de uso',
                        style: Get.textTheme.bodySmall,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Condiciones de uso');
                          },
                      ),
                      TextSpan(
                        text: ' y ',
                      ),
                      TextSpan(
                        text: 'Política de privacidad',
                        style: Get.textTheme.bodySmall,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Política de privacidad');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ElevatedButton(
                    onPressed: _comprobarFormularioDeRegistro,
                    child: Text('Registrarse'),
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
                onPressed: () => Get.toNamed('/login'),
                child: Text('¿Ya tienes cuenta? Iniciar Sesión',
                    style: Get.textTheme.bodySmall),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _comprobarFormularioDeRegistro() async {
    if (_emailController.text == '' ||
        _passwordController.text == '' ||
        _confirmPasswordController.text == '') {
      Get.snackbar(
        'Error',
        'Rellena todos los campos',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(_emailController.text)) {
      Get.snackbar(
        'Error',
        'El email no es válido',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return;
    } else if (!passwordRegex.hasMatch(_passwordController.text)) {
      Get.snackbar(
        'Error',
        'La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula y un número',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Las contraseñas no coinciden',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
      return;
    } else {
      bool estaRegistrado = await _autentificacionController.registrarEmail(
          _emailController.text, _passwordController.text);
      if (estaRegistrado) {
        Get.offNamed('/name');
      } else {
        Get.snackbar(
          'Error',
          'El email ya está registrado',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
      }
    }
  }
}
