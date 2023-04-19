import 'dart:io';

import 'package:change_house_colors/routes/routes.dart';
import 'package:change_house_colors/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final predictService = Get.find<PredictService>();

  @override
  void onInit() async {
    super.onInit();
    try {
      await predictService.checkServer();
      Get.offNamed(Routes.decorate);
    } catch (e) {
      Get.dialog(AlertDialog(
        title: const Text('Error'),
        content: const Text('Server is offline, please come back later!'),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => exit(0),
          ),
        ],
      ));
    }
  }
}
