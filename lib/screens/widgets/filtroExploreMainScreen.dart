import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ContentBottomSheetFilter extends StatelessWidget {
  ContentBottomSheetFilter({
    super.key,
  });

  String gender = "Hombre";
  RangeValues _currentRangeValues = const RangeValues(18, 35);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Filtros',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Género", style: Get.textTheme.bodyMedium),
            SizedBox(height: 20),
            ListTile(
              title:
                  const Text('Hombre', style: TextStyle(color: Colors.black)),
              trailing: Radio<String>(
                value: "Hombre",
                groupValue: gender,
                onChanged: (String? value) {
                  gender = value!;
                  Get.forceAppUpdate();
                },
              ),
            ),
            Divider(),
            ListTile(
              title: const Text('Mujer', style: TextStyle(color: Colors.black)),
              trailing: Radio<String>(
                value: "Mujer",
                groupValue: gender,
                onChanged: (String? value) {
                  gender = value!;
                  Get.forceAppUpdate();
                },
              ),
            ),
            Divider(),
            ListTile(
              title: const Text('Otro', style: TextStyle(color: Colors.black)),
              trailing: Radio<String>(
                value: "Otro",
                groupValue: gender,
                onChanged: (String? value) {
                  gender = value!;
                  Get.forceAppUpdate();
                },
              ),
            ),
            Divider(),
            SizedBox(height: 30),
            Text("Localidad", style: Get.textTheme.bodyMedium),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Seleccionar localidad'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 20.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Edad", style: Get.textTheme.bodyMedium),
                Text(
                  "${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}",
                  style: Get.textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 20),
            RangeSlider(
              values: _currentRangeValues,
              max: 80,
              min: 18,
              divisions: 62,
              onChanged: (RangeValues values) {
                _currentRangeValues = values;
                Get.forceAppUpdate();
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Filtrar'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
