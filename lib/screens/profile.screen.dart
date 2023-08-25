import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';

import '../controllers/usuario.controller.dart';
import '../utils/calculoEdad.util.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final UsuarioController usuarioController = Get.find<UsuarioController>();
  final AutentificacionController _autentificacionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: Get.height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/onboarding.jpeg',
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16.0), // Define el espacio de relleno deseado
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${usuarioController.usuario.nombre}, ${calculoEdad(usuarioController.usuario.fechaNacimiento!)}',
                    style: Get.textTheme.bodyLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Editar Perfil')),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Profesión: ${usuarioController.usuario.profesion}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Text(
                'Provincia',
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '${usuarioController.usuario.provincia}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Text(
                'Descripción',
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '${usuarioController.usuario.descripcion}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Text(
                'Información personal',
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Genero: ${usuarioController.usuario.genero}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Busca: ${usuarioController.usuario.sexoBusca}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Orientación: ${usuarioController.usuario.orientacionSexual!.map((e) => e.toString()).join(", ")}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Tipo de relación: ${usuarioController.usuario.tipoRelacionBusca!.map((e) => e.toString()).join(", ")}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Intereses: ${usuarioController.usuario.intereses!.map((e) => e.toString()).join(", ")}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Altura: ${usuarioController.usuario.altura}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Peso: ${usuarioController.usuario.peso}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Frecuencia de entrenamiento: ${usuarioController.usuario.frecuenciaEntrenamiento}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Text(
                'Horario de entrenamiento: ${usuarioController.usuario.horarioEntrenamiento}',
                style: Get.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              usuarioController.usuario.fotos.length != 0
                  ? Container(
                      height: usuarioController.usuario.fotos.length > 3
                          ? Get.height * 0.43
                          : Get.height * 0.22,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          childAspectRatio:
                              1 / 1.5, // Espaciado horizontal entre elementos
                        ),
                        itemCount: usuarioController.usuario.fotos.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Aquí construyes y retornas cada elemento de la cuadrícula
                          return _gridComponentConFoto(
                              usuarioController.usuario.fotos[index]);
                        },
                      ),
                    )
                  : Container(),
              // Obx(() => Text(
              //       'Fotos: ${usuarioController.usuario.fotos}',
              //       style: Get.textTheme.bodySmall,
              //     )),
              ElevatedButton(
                onPressed: () async {
                  await _autentificacionController.logout();
                  if (_autentificacionController.loggedIn == false) {
                    Get.offAllNamed('/');
                  }
                },
                child: Text('Logout'),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _gridComponentConFoto(String url) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
