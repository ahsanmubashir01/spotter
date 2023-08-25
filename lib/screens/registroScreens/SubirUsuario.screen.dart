import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/usuario.controller.dart';

class SubirUsuarioScreen extends StatelessWidget {
  SubirUsuarioScreen({super.key});

  final UsuarioController registrarUsuario = Get.find<UsuarioController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: registrarUsuario.registrarUsuario(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error al cargar con la base de datos',
                    style: Get.textTheme.displayMedium);
              }
              // return Text('Error al cargar con la base de datos',
              //     style: Get.textTheme.displayMedium);
              if (snapshot.connectionState == ConnectionState.done) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (registrarUsuario.isRegistrado == true &&
                      registrarUsuario.estadoSubida == 'Datos guardados') {
                    Get.offAllNamed('/verificacionCorreo');
                  }
                });

                return Text(registrarUsuario.estadoSubida.value,
                    style: Get.textTheme.bodySmall);
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        registrarUsuario.estadoSubida.value,
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    backgroundColor: Get.theme.primaryColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Get.theme.primaryColorDark),
                    minHeight: 3,
                  )
                ],
              );
            }),
      ),
    );
  }
}
