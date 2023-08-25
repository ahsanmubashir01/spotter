import 'dart:io';

import 'package:get/get.dart';
import 'package:spotter/services/usuario.service.dart';
import '../models/usuario.dart';

class UsuarioController extends GetxController {
  final UsuarioService _usuarioService = UsuarioService();

  Usuario usuario = Usuario();
  List<File> fotosLocales = [];
  var isLoaded = false.obs;
  RxString estadoSubida = "Cargando...".obs;
  RxBool isRegistrado = false.obs;

  @override
  void onInit() {
    super.onInit();
    // usuario.nombre = 'Ausias';
    // usuario.provincia = 'Valencia';
    // usuario.genero = 'Hombre';
    // usuario.fechaNacimiento = DateTime(1997, 03, 13);
    // usuario.sexoBusca = 'Mujer';
    // usuario.profesion = 'Estudiante';
    // usuario.orientacionSexual = ['Heterosexual'];
    // usuario.tipoRelacionBusca = ['Amistad', 'Relación'];
    // usuario.intereses = ['Deporte', 'Cine', 'Música'];
    // usuario.descripcion = 'Me gusta el deporte y la música';
    // usuario.altura = 1.85;
    // usuario.peso = 102;
    // usuario.frecuenciaEntrenamiento = '3-4 días por semana';
    // usuario.horarioEntrenamiento = 'Mañanas';
    // usuario.fotos = [
    //   'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
    //   'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
    //   'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
    //   'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
    // ];

    // usuario = _usuarioService.getUsuario();
    // isLoaded.value = true;
  }

  Future registrarUsuario() async {
    estadoSubida.value = 'Registrando usuario...';
    isRegistrado.value =
        await _usuarioService.crearUsuario(usuario, fotosLocales);
    isRegistrado.value == true
        ? estadoSubida.value = 'Datos guardados'
        : estadoSubida.value = 'Error al guardar datos';
  }
}
