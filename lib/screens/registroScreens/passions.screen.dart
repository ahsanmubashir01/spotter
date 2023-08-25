import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/usuario.controller.dart';
import 'package:spotter/screens/registroScreens/privacypolicy.dart';

import '../widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class PassionsScreen extends StatelessWidget {
  PassionsScreen({super.key});

  final List<String> _options = [
    'Natación',
    'Juegos',
    'Música',
    'Deporte',
    'Halterofilia',
    'cardio',
    'Correr',
    'Yoga',
    'Pesas',
    'Karaoke',
    'Pintar',
    'Escribir',
    'Películas'
  ];
  List<String> _selectedOptions = [];

  final UsuarioController registrarUsuario = Get.find<UsuarioController>();

  void _toggleOption(String option) {
    if (_selectedOptions.contains(option)) {
      _selectedOptions.remove(option);
    } else {
      _selectedOptions.add(option);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Listado de fotos en pasiones:' +
        registrarUsuario.fotosLocales.toString());

    return Scaffold(
        appBar: appBarSpotterRegister(-1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Text("Tu interés ...", style: Get.textTheme.bodyLarge),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PrivacyPolicy()), //call any screen
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                    "Selecciona algunos de tus intereses y haz que todo el mundo sepa lo que te apasiona.",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                Center(child: _chipList()),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_selectedOptions.length > 0) {
                          registrarUsuario.usuario.intereses = _selectedOptions;

                          Get.toNamed('/exploreMain'); // call any screen
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes seleccionar al menos un interés',
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
                ),
              ],
            ),
          ),
        ));
  }

  Widget _chipList() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20.0,
      runSpacing: 10.0,
      children: _options
          .map(
            (option) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceChip(
                label: Text(option),
                selected: _selectedOptions.contains(option),
                onSelected: (selected) {
                  _toggleOption(option);
                  Get.forceAppUpdate();
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
