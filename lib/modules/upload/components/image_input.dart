import 'dart:io';
import 'package:change_house_colors/modules/upload/decorate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInput extends GetView<DecorateController> {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2)),
      child: Obx(() => _renderImage(controller.imageInput.value)),
    );
  }

  Widget _renderImage(String? path) {
    if (path == null) {
      return IconButton(
        icon: const Icon(Icons.add_a_photo),
        iconSize: 50,
        onPressed: () {
          controller.showImageSourcePicker();
        },
      );
    }
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: controller.useAsset.value
              ? Image.asset(path, fit: BoxFit.contain)
              : Image.file(
                  File(path),
                  fit: BoxFit.contain,
                ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: const Icon(Icons.add_a_photo),
            iconSize: 30,
            onPressed: () {
              controller.showImageSourcePicker();
            },
          ),
        )
      ],
    );
  }
}
