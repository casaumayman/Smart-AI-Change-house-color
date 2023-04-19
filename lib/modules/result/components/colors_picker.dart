import 'package:change_house_colors/modules/result/result_controller.dart';
import 'package:change_house_colors/modules/upload/components/color_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsPicker extends GetView<ResultController> {
  const ColorsPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pick colors:",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => ColorCell(
                  color: controller.roofColor.value,
                  label: "Roof",
                  onPress: () {
                    controller.showColorPickerDialog("Roof");
                  })),
              Obx(() => ColorCell(
                  color: controller.wallColor.value,
                  label: "Wall",
                  onPress: () {
                    controller.showColorPickerDialog("Wall");
                  })),
              Obx(() => ColorCell(
                  color: controller.doorColor.value,
                  label: "Door",
                  onPress: () {
                    controller.showColorPickerDialog("Door");
                  })),
            ],
          )
        ],
      ),
    );
  }
}
