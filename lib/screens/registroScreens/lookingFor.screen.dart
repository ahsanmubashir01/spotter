import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/usuario.controller.dart';
import '../widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class LookingForScreen extends StatelessWidget {
  LookingForScreen({super.key});

  final UsuarioController registrarUsuario = Get.find();

  Map<String, bool> _lookingIsSelected = {
    'Gymbros': false,
    'Reunirse fuera': false,
    'Ocasional': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSpotterRegister(8),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Buscas ...", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Selecciona hasta 2", style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                _opcionLooking(_lookingIsSelected.keys.toList()[0].toString(),
                    _lookingIsSelected),
                _opcionLooking(_lookingIsSelected.keys.toList()[1].toString(),
                    _lookingIsSelected),
                _opcionLooking(_lookingIsSelected.keys.toList()[2].toString(),
                    _lookingIsSelected),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_lookingIsSelected.values
                                .where((element) => element == true)
                                .length >
                            0) {
                          registrarUsuario.usuario.tipoRelacionBusca =
                              _lookingIsSelected.keys
                                  .where((element) =>
                                      _lookingIsSelected[element] == true)
                                  .toList();
                          Get.toNamed("/photosAdd");
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes seleccionar al menos una opcion',
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

  Widget _opcionLooking(String titulo, Map<String, bool> _lookingIsSelected) {
    return ListTile(
      title: Text(titulo, style: TextStyle(color: Colors.black)),
      trailing: Checkbox(
          value: _lookingIsSelected[titulo],
          onChanged: (value) {
            _lookingIsSelected[titulo] = value!;
            if (_lookingIsSelected.values
                    .where((element) => element == true)
                    .length >
                2) {
              _lookingIsSelected[titulo] = false;
            }
            Get.forceAppUpdate();
          }),
    );
  }
}
