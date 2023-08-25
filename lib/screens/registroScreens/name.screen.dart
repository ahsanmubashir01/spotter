import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/usuario.controller.dart';
import 'package:spotter/screens/widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class NameScreen extends StatelessWidget {
  NameScreen({super.key});

  final UsuarioController registrarUsuario = Get.put(UsuarioController());
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (registrarUsuario.usuario.nombre != "") {
      _nameController.text = registrarUsuario.usuario.nombre == null
          ? ""
          : registrarUsuario.usuario.nombre.toString();
    }

    return Scaffold(
        appBar: appBarSpotterRegister(1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tu nombre es ...", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Así aparecerá en su perfil",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Ej. Adam',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_nameController.text != "") {
                          registrarUsuario.usuario.nombre =
                              _nameController.text;
                          Get.toNamed('/location');
                        } else {
                          Get.snackbar(
                            'Error',
                            'El nombre no puede estar vacío',
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
