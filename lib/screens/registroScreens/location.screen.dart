import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/usuario.controller.dart';

import '../../utils/listaProvincias.utils.dart';
import '../widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final UsuarioController registrarUsuario = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSpotterRegister(2),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vives en ...", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text(
                    "Por defecto se buscarán personas en esta provincia. Si quieres buscar en otras provincias, puedes cambiarlo en la ventana principal.",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: registrarUsuario.usuario.provincia,
                  decoration: InputDecoration(
                    hintText: 'Provincia',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color.fromARGB(255, 225, 225, 225),
                    filled: true,
                  ),
                  dropdownColor: Color.fromARGB(255, 225, 225, 225),
                  style: TextStyle(
                    fontFamily: 'Swis721',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  menuMaxHeight: Get.height * 0.7,
                  borderRadius: BorderRadius.circular(40),
                  onChanged: (value) {
                    registrarUsuario.usuario.provincia = value.toString();
                    Get.forceAppUpdate();
                  },
                  items: listadoProvinces.map((province) {
                    return DropdownMenuItem(
                      value: province,
                      child: Text(province),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (registrarUsuario.usuario.provincia != null) {
                          Get.toNamed('/gender');
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes seleccionar una provincia',
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
