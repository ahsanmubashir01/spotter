import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/usuario.controller.dart';

import '../widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  final UsuarioController registrarUsuario = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSpotterRegister(3),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Eres ...", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Por favor, selecciona tu sexo.",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                ListTile(
                  title: const Text('Hombre',
                      style: TextStyle(color: Colors.black)),
                  trailing: Radio<String>(
                    value: "Hombre",
                    groupValue: registrarUsuario.usuario.genero,
                    onChanged: (String? value) {
                      registrarUsuario.usuario.genero = value!;
                      Get.forceAppUpdate();
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  title: const Text('Mujer',
                      style: TextStyle(color: Colors.black)),
                  trailing: Radio<String>(
                    value: "Mujer",
                    groupValue: registrarUsuario.usuario.genero,
                    onChanged: (String? value) {
                      registrarUsuario.usuario.genero = value!;
                      Get.forceAppUpdate();
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  title:
                      const Text('Otro', style: TextStyle(color: Colors.black)),
                  trailing: Radio<String>(
                    value: "Otro",
                    groupValue: registrarUsuario.usuario.genero,
                    onChanged: (String? value) {
                      registrarUsuario.usuario.genero = value!;
                      Get.forceAppUpdate();
                    },
                  ),
                ),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (registrarUsuario.usuario.genero != null) {
                          Get.toNamed('/birthday');
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes seleccionar un sexo',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Get.theme.colorScheme.error,
                            colorText: Get.theme.colorScheme.onError,
                          );
                        }
                      },
                      icon: Text("Siguiente"),
                      label: Icon(
                        Icons.arrow_back_rounded,
                        textDirection: TextDirection.rtl,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
