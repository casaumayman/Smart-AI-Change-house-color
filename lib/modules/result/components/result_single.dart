import 'dart:io';

import 'package:change_house_colors/modules/result/result_controller.dart';
import 'package:change_house_colors/shared/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ResultSingle extends GetView<ResultController> {
  const ResultSingle({super.key});

  _onDownload() async {
    _showLoadingDialog();
    if (controller.imageResultByte.value == null) {
      return;
    }
    if (Platform.isAndroid) {
      final directory = Directory('/sdcard/Download/SmartHouseChangeColor');
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      DateTime now = DateTime.now();
      int timestamp = now.millisecondsSinceEpoch;
      final filePath = '${directory.path}/result_$timestamp.png';
      final file = File(filePath);
      final future = file.writeAsBytes(controller.imageResultByte.value!);
      future.then((value) {
        Get.back();
        showSnackbarSuccess("Image saved to ${value.path}");
      }).catchError((onError) {
        Get.back();
        showSnackbarError("Save image failed!");
        debugPrint("Save image fail $onError");
      });
    } else {
      try {
        await ImageGallerySaver.saveImage(controller.imageResultByte.value!);
        Get.back();
        showSnackbarSuccess("Image saved to Photos");
      } catch (e) {
        Get.back();
        showSnackbarError("Save image failed!");
        debugPrint("Save image fail $e");
      }
    }
  }

  _showLoadingDialog() {
    Get.dialog(AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text("Saving image..."),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => Image.memory(
              controller.imageResultByte.value!,
              fit: BoxFit.contain,
            )),
        Positioned(
          top: 10,
          right: 10,
          child: Row(
            children: [
              // GestureDetector(
              //   onTap: () {
              //     debugPrint("Zoom clicked");
              //   },
              //   child: Align(
              //       alignment: Alignment.bottomRight,
              //       child: Container(
              //         padding: const EdgeInsets.all(5),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(100),
              //             border: Border.all(width: 2, color: Colors.white)),
              //         child: const Icon(
              //           Icons.zoom_out_map,
              //           color: Colors.white,
              //           size: 30,
              //         ),
              //       )),
              // ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  _onDownload();
                },
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.white)),
                      child: const Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
