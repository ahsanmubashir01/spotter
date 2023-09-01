import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotter/controllers/autentificacion.controller.dart';

import '../controllers/usuario.controller.dart';
import '../utils/calculoEdad.util.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          padding: EdgeInsets.all(16.0),
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
                    onPressed: () {},
                    child: Text('Editar Perfil'),
                  ),
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
              // Continue adding the rest of your widgets
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
