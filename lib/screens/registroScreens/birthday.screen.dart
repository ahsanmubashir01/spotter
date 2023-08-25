import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/usuario.controller.dart';
import '../widgets/stylePageSesions.dart';

// ignore: must_be_immutable
class BirthdayScreen extends StatelessWidget {
  BirthdayScreen({super.key});
  final UsuarioController registrarUsuario = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSpotterRegister(4),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tu cumpleaños es ...", style: Get.textTheme.bodyLarge),
                SizedBox(height: 20),
                Text("Solo su edad se mostrará en su perfil.",
                    style: Get.textTheme.bodyMedium),
                SizedBox(height: 20),
                Container(
                  height: 216,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime(2000, 1,
                        1), // ESTA FECHA ES LA QUE SE MUESTRA Y SE PONE AL USUARIO POR DEFECTO, SI SE CAMBIA AQUÍ SE CAMBIA EN EL CONTROLLER REGISTRAR USUARIO
                    mode: CupertinoDatePickerMode.date,
                    maximumDate: DateTime(DateTime.now().year - 18,
                        DateTime.now().month, DateTime.now().day),
                    minimumYear: DateTime.now().year - 120,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      registrarUsuario.usuario.fechaNacimiento = newDate;
                      Get.forceAppUpdate();
                    },
                    dateOrder: DatePickerDateOrder.dmy,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Get.toNamed("/showMe"),
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
