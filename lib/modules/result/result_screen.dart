import 'package:change_house_colors/modules/result/components/colors_picker.dart';
import 'package:change_house_colors/modules/result/components/origin_image.dart';
import 'package:change_house_colors/modules/result/components/result_mask.dart';
import 'package:change_house_colors/modules/result/components/result_single.dart';
import 'package:change_house_colors/modules/result/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change color")),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        const OriginImage(),
        const SizedBox(
          height: 5,
        ),
        Obx(() {
          if (controller.imageResultByte.value == null) {
            return const ResultMask();
          }
          return const ResultSingle();
        }),
        const ColorsPicker(),
        ElevatedButton(
            onPressed: controller.changeColor,
            child: const Text("Change color"))
      ]),
    );
  }
}
