import 'dart:async';

import 'package:change_house_colors/modules/result/components/color_picker_dialog.dart';
import 'package:change_house_colors/modules/upload/components/loading_dialog.dart';
import 'package:change_house_colors/modules/upload/components/samples_dialog.dart';
import 'package:change_house_colors/routes/routes.dart';
import 'package:change_house_colors/shared/services/services.dart';
import 'package:change_house_colors/shared/utils/image_picker_utils.dart';
import 'package:change_house_colors/shared/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DecorateController extends GetxController {
  final _predictServices = Get.find<PredictService>();
  final screenName = Get.arguments;

  String _fileInputName = "";
  Timer? _timer;
  Timer? _countdownTimer;

  final imageInput = Rx<String?>(null);
  final useAsset = false.obs;
  final inQueue = (-1).obs;
  final remainTime = (-1).obs;

  final exteriorAssets = [
    "lib/assets/samples/exterior-sample-1.jpg",
    "lib/assets/samples/exterior-sample-2.jpg"
  ];

  void _onPickAsset(String assetPath) async {
    useAsset.value = true;
    imageInput.value = assetPath;
    _fileInputName = "sample.jpg";
  }

  void showColorPickerDialog(String objectName) {
    Get.dialog(ColorPickerDialog(objectName));
  }

  void showImageSourcePicker() async {
    var res =
        await showImagePicker<String>(["Camera", "Library", "Use samples"]);
    if (res == null) {
      return;
    }
    final ImagePicker picker = ImagePicker();
    try {
      if (res == "Camera") {
        var image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          imageInput.value = image.path;
          _fileInputName = image.name;
        }
        useAsset.value = false;
        return;
      } else if (res == "Library") {
        var image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          imageInput.value = image.path;
          _fileInputName = image.name;
        }
        useAsset.value = false;
        return;
      } else {
        Get.dialog(SamplesDialog(
          images: exteriorAssets,
          onPress1: () {
            _onPickAsset(exteriorAssets[0]);
          },
          onPress2: () {
            _onPickAsset(exteriorAssets[1]);
          },
        ));
      }
    } catch (e) {
      showSnackbarError("$e");
    }
  }

  void startPredict() async {
    _showLoadingDialog();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainTime.value > 0) {
        remainTime.value -= 1;
      }
    });
    try {
      final predictId = await _predictServices.predict(
          imageInput.value!, _fileInputName, useAsset.value);
      debugPrint("predict id: $predictId");
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
        try {
          final resultUrls = await _predictServices.getResults(predictId);
          debugPrint("Get result: $resultUrls, type ${resultUrls.runtimeType}");
          if (resultUrls == null) {
            return;
          }
          if (resultUrls.runtimeType == String) {
            String maskUrl = resultUrls;
            _cancelTimer();
            Get.back();
            Get.toNamed(Routes.results,
                arguments: {"mask": maskUrl, "predictId": predictId});
            timer.cancel();
          } else {
            inQueue.value = resultUrls['inQueue'];
            if (remainTime.value <= 0) {
              remainTime.value = resultUrls['initialCountDown'];
            }
          }
        } catch (e) {
          Get.back();
          _cancelTimer();
          debugPrint("Get result error: ${e.toString()}");
          timer.cancel();
          //Get result error
        }
      });
    } catch (e) {
      Get.back();
      _cancelTimer();
      debugPrint("error: $e");
      showSnackbarError(e.toString());
    }
  }

  void _cancelTimer() {
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
      _timer = null;
    }
    if (_countdownTimer != null) {
      if (_countdownTimer!.isActive) {
        _countdownTimer!.cancel();
      }
      _countdownTimer = null;
    }
    remainTime.value = -1;
    inQueue.value = -1;
  }

  void _showLoadingDialog() {
    Get.dialog(
        LoadingDialog(
          _cancelTimer,
        ),
        barrierDismissible: false);
  }
}
