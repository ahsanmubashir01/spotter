import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/usuario.controller.dart';
import '../widgets/stylePageSesions.dart';

class OccupationScreen extends StatelessWidget {
  OccupationScreen({super.key});

  final UsuarioController registrarUsuario = Get.find();
  final TextEditingController _occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (registrarUsuario.usuario.profesion != "") {
      _occupationController.text = registrarUsuario.usuario.profesion == null
          ? ""
          : registrarUsuario.usuario.profesion.toString();
    }

    return Scaffold(
        appBar: appBarSpotterRegister(6),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tu Profesión ...", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Esto sólo aparecerá en tu perfil",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                TextField(
                  controller: _occupationController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Ej. Artista',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_occupationController.text != "") {
                          registrarUsuario.usuario.profesion =
                              _occupationController.text;
                          Get.toNamed('/sexualOrientation');
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes ingresar tu profesión',
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
