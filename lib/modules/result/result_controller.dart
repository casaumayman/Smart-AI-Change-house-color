import 'dart:typed_data';

import 'package:change_house_colors/modules/result/components/color_picker_dialog.dart';
import 'package:change_house_colors/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final _predictService = Get.find<PredictService>();
  final String maskUrl = Get.arguments['mask'];
  final int predictId = Get.arguments['predictId'];

  final wallColor = Rx<Color>(Colors.blue);
  final roofColor = Rx<Color>(Colors.green);
  final doorColor = Rx<Color>(Colors.yellow);
  final imageResultByte = Rx<Uint8List?>(null);

  changeColor() async {
    Get.dialog(AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text("Changing color..."),
        ],
      ),
    ));
    Uint8List? imageData = await _predictService.changeColor(
        predictId, roofColor.value, wallColor.value, doorColor.value);
    if (imageData != null) {
      imageResultByte.value = imageData;
    }
    Get.back();
  }

  void showColorPickerDialog(String objectName) {
    Get.dialog(ColorPickerDialog(objectName));
  }
}
