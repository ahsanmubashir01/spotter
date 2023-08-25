import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/usuario.controller.dart';
import '../widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class SexualOrientationScreen extends StatelessWidget {
  SexualOrientationScreen({super.key});

  final UsuarioController registrarUsuario = Get.find();
  Map<String, bool> _orientationIsSelected = {
    'Heterosexual': false,
    'Gay': false,
    'Lesbiana': false,
    'Bisexual': false,
    'Asexual': false,
    'Pansexual': false,
    'Demisexual': false,
    'Queer': false,
    'Cuestionable': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSpotterRegister(7),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tu orientación sexual es ...",
                    style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Selecciona hasta 3", style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[0].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[1].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[2].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[3].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[4].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[5].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[6].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[7].toString(),
                    _orientationIsSelected),
                _opcionOrientacion(
                    _orientationIsSelected.keys.toList()[8].toString(),
                    _orientationIsSelected),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_orientationIsSelected.values
                                .where((element) => element == true)
                                .length >
                            0) {
                          registrarUsuario.usuario.orientacionSexual =
                              _orientationIsSelected.keys
                                  .where((element) =>
                                      _orientationIsSelected[element] == true)
                                  .toList();
                          Get.toNamed('/lookingFor');
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes seleccionar al menos una orientación sexual',
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

  Widget _opcionOrientacion(
      String titulo, Map<String, bool> _orientationIsSelected) {
    return ListTile(
      title: Text(titulo, style: TextStyle(color: Colors.black)),
      trailing: Checkbox(
          value: _orientationIsSelected[titulo],
          onChanged: (value) {
            _orientationIsSelected[titulo] = value!;
            if (_orientationIsSelected.values
                    .where((element) => element == true)
                    .length >
                3) {
              _orientationIsSelected[titulo] = false;
            }
            Get.forceAppUpdate();
          }),
    );
  }
}
