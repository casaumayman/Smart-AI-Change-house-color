import 'dart:io';
import 'package:change_house_colors/modules/upload/decorate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OriginImage extends GetView<DecorateController> {
  const OriginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => _renderImage(controller.imageInput.value));
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
    return Container(
      alignment: Alignment.center,
      child: controller.useAsset.value
          ? Image.asset(path, fit: BoxFit.contain)
          : Image.file(
              File(path),
              fit: BoxFit.contain,
            ),
    );
  }
}
