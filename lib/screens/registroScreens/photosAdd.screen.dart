import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotter/controllers/usuario.controller.dart';

import '../widgets/stylePageSesions.dart';

class PhotosAddScreen extends StatelessWidget {
  PhotosAddScreen({super.key});

  final ImagePicker picker = ImagePicker();

  final UsuarioController registrarUsuario = Get.find<UsuarioController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSpotterRegister(9),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Añade fotos", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Se verán en el orden que las pongas",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                Container(
                  height: Get.height * 0.5,
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.5,
                    children: <Widget>[
                      registrarUsuario.fotosLocales.length > 0
                          ? _gridComponentConFoto(
                              registrarUsuario.fotosLocales[0])
                          : _gridComponentSinFoto(),
                      registrarUsuario.fotosLocales.length > 1
                          ? _gridComponentConFoto(
                              registrarUsuario.fotosLocales[1])
                          : _gridComponentSinFoto(),
                      registrarUsuario.fotosLocales.length > 2
                          ? _gridComponentConFoto(
                              registrarUsuario.fotosLocales[2])
                          : _gridComponentSinFoto(),
                      registrarUsuario.fotosLocales.length > 3
                          ? _gridComponentConFoto(
                              registrarUsuario.fotosLocales[3])
                          : _gridComponentSinFoto(),
                      registrarUsuario.fotosLocales.length > 4
                          ? _gridComponentConFoto(
                              registrarUsuario.fotosLocales[4])
                          : _gridComponentSinFoto(),
                      registrarUsuario.fotosLocales.length > 5
                          ? _gridComponentConFoto(
                              registrarUsuario.fotosLocales[5])
                          : _gridComponentSinFoto(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (registrarUsuario.fotosLocales.length > 0) {
                          Get.toNamed("/passions");
                        } else {
                          Get.snackbar(
                            'Error',
                            'Debes añadir al menos una foto',
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

/**
 * Seleccionador de imagen para el grid de fotos
 */
  Future<void> _selectImage() async {
    try {
      Get.defaultDialog(
        title: 'Seleccionar imagen',
        titleStyle: Get.textTheme.displayLarge,
        titlePadding: EdgeInsets.only(top: 20, left: 20, right: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Cámara', style: Get.textTheme.bodyMedium),
              onTap: () async {
                Get.back();
                XFile? image;
                try {
                  image = await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    Get.defaultDialog(
                      title: 'comprimiendo imagen',
                      content: LinearProgressIndicator(),
                      barrierDismissible: false,
                      backgroundColor: Colors.transparent,
                    );
                    final File? compressedImage =
                        await compressImage(File(image.path));

                    registrarUsuario.fotosLocales.add(compressedImage!);
                    print('image: $compressedImage');
                    Get.forceAppUpdate();
                    Get.back();
                  }
                } catch (e) {
                  print(e);
                  Get.snackbar(
                    'Error',
                    'Algo ha ido mal al hacer la foto',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Get.theme.colorScheme.error,
                    colorText: Get.theme.colorScheme.onError,
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title:
                  Text('Biblioteca de fotos', style: Get.textTheme.bodyMedium),
              onTap: () async {
                Get.back();
                XFile? image;
                try {
                  image = await picker.pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    print('image: entra en el if');
                    Get.defaultDialog(
                      title: 'comprimiendo imagen',
                      content: LinearProgressIndicator(),
                      barrierDismissible: false,
                      backgroundColor: Colors.transparent,
                    );
                    final File? compressedImage =
                        await compressImage(File(image.path));
                    registrarUsuario.fotosLocales.add(compressedImage!);
                    print('image: $compressedImage');
                    Get.forceAppUpdate();
                    Get.back();
                  }
                } catch (e) {
                  print(e);
                  Get.snackbar(
                    'Error',
                    'Algo ha ido mal al seleccionar la imagen',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Get.theme.colorScheme.error,
                    colorText: Get.theme.colorScheme.onError,
                  );
                }
              },
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error al seleccionar imagen: $e');
    }
  }

/**
* Comprime las imágenes para que no pesen tanto
* @param File file
* @return File?
*/
  Future<File?> compressImage(File file) async {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      file.path.replaceAll(RegExp(r'\.\w+$'), '_compressed.jpg'),
      quality: 40,
    );

    print(file.lengthSync() / 1024);
    print(result!.lengthSync() / 1024);

    return result;
  }

/**
 * Componente de la grilla con foto
 * @param File url
 * @return Widget
 */
  Widget _gridComponentConFoto(File url) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Image.file(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  registrarUsuario.fotosLocales
                      .removeWhere((element) => element == url);
                  Get.forceAppUpdate();
                  print('tamaño lista fotos: ' +
                      registrarUsuario.fotosLocales.length.toString());
                  print('lista fotos: ' +
                      registrarUsuario.fotosLocales.toString());
                },
                color: Get.theme.primaryColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }

/**
 * Componente de la grilla sin foto
 * @param File url
 * @return Widget
 */
  Widget _gridComponentSinFoto() {
    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(15),
          dashPattern: [5, 5],
          color: Get.theme.primaryColorDark,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _selectImage();
                  },
                  color: Get.theme.primaryColorDark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
