import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/usuario.dart';

class UsuarioService {
  // crear usuario
  Future<bool> crearUsuario(Usuario usuario, List<File> images) async {
    try {
      // Iniciamos una transacción
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Obtenemos la cuenta de usuario en Firebase Authentication
        FirebaseAuth.instance.currentUser?.reload();
        UserCredential userCredential =
            FirebaseAuth.instance.currentUser! as UserCredential;

        // Subimos las imágenes a Firebase Storage
        List<String> imageUrls =
            await _subirFotosStorage(userCredential, images);

        // Guardamos la información del usuario en Firestore
        usuario.fotos = imageUrls;
        await _guardarDatosUsuario(userCredential, usuario);
      });
      return true;
    } catch (e) {
      print('Error en la transacción: $e');
      return false;
    }
  }

  // Obtener Usuario por id
  Future<Usuario> obtenerUsuarioConId(String idUsuario) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(idUsuario)
          .get();

      print('userDoc: ${userDoc.data()}');
      return Usuario.fromMap(
          userDoc.data()! as Map<String, dynamic>, idUsuario);
    } catch (e) {
      print('Error al obtener usuario: $e');
      return Usuario();
    }
  }

  // Eliminar Usuario por id
  Future<bool> eliminarUsuarioId(String idUsuario) async {
    try {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(idUsuario);
      await userRef.update({'isActive': false});
      return true;
    } catch (e) {
      print('Error al eliminar cuenta: $e');
      return false;
    }
  }

  // Actualizar Usuario por id
  Future<bool> actualizarDatosUsuario(
      String idUsuario, Usuario userData) async {
    try {
      DocumentReference userDocRef =
          await FirebaseFirestore.instance.collection('users').doc(idUsuario);
      await userDocRef.update(userData.toMap());
      return true;
    } catch (e) {
      print('Error al actualizar datos de usuario: $e');
      return false;
    }
  }

  // Actualizar fotos de Usuario por id
  Future<bool> actualizarFotosUsuario(
      String idUsuario, List<File> images) async {
    try {
      // Iniciamos una transacción
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Obtenemos la cuenta de usuario en Firebase Authentication
        FirebaseAuth.instance.currentUser?.reload();
        UserCredential userCredential =
            FirebaseAuth.instance.currentUser! as UserCredential;

        // filtramos las images que ya estaban en el storage
        // TODO revisar este apartado, hay que revisar las imagenes que hay y las que se suben
        Usuario usuario = await obtenerUsuarioConId(idUsuario);
        List<String> imagesUrls = usuario.fotos ?? [];
        List<File> imagesToUpload = [];
        for (File image in images) {
          if (!imagesUrls.contains(image.path)) {
            imagesToUpload.add(image);
          }
        }

        // Subimos las imágenes a Firebase Storage
        List<String> imageUrls =
            await _subirFotosStorage(userCredential, images);

        // Actualizamos la información del usuario en Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(idUsuario)
            .update({'fotos': imageUrls});
      });
      return true;
    } catch (e) {
      print('Error en la transacción: $e');
      return false;
    }
  }

  Future<List<String>> _subirFotosStorage(
      UserCredential userCredential, List<File> images) async {
    List<String> imageUrls = [];
    for (File image in images) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child(userCredential.user!.uid)
          .child(image.path.split('/').last.toString());
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot storageTaskSnapshot =
          await uploadTask.whenComplete(() => null);
      String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  Future<void> _guardarDatosUsuario(
      UserCredential userCredential, Usuario userData) async {
    DocumentReference userDocRef = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid);
    await userDocRef.set(userData.toMap());
  }
}
