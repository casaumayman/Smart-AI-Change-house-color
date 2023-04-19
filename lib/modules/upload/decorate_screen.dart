import 'package:change_house_colors/modules/upload/components/image_input.dart';
import 'package:change_house_colors/modules/upload/decorate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecorateScreen extends GetView<DecorateController> {
  const DecorateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const screenName = "Upload input";
    return Scaffold(
      appBar: AppBar(title: const Text(screenName)),
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(child: ImageInput()),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // const ThemePicker(),
                // const NumOfResultPicker(),
                // const ColorsPicker(),
                Obx(() => ElevatedButton(
                    onPressed: controller.imageInput.value != null
                        ? controller.startPredict
                        : null,
                    child: const Text("Start")))
              ],
            ),
          ))
        ],
      )),
    );
  }
}
