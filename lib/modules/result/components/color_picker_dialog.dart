import 'package:change_house_colors/modules/result/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class ColorPickerDialog extends GetView<ResultController> {
  const ColorPickerDialog(this.objectName, {super.key});

  final String objectName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pick a color"),
      content: SingleChildScrollView(
          child: BlockPicker(
        pickerColor: Colors.black,
        onColorChanged: (c) {
          if (objectName == "Roof") {
            controller.roofColor.value = c;
          } else if (objectName == "Wall") {
            controller.wallColor.value = c;
          } else {
            controller.doorColor.value = c;
          }
          Get.back();
        },
      )),
    );
  }
}
