import 'package:change_house_colors/modules/upload/decorate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends GetView<DecorateController> {
  const LoadingDialog(this.onCancel, {super.key});

  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Processing...",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() {
                    if (controller.inQueue.value == -1) {
                      return const Text("Initial your request!");
                    } else if (controller.inQueue.value == 0) {
                      return const Text("Processing your request");
                    }
                    return Text(
                        "Your position in the queue is ${controller.inQueue.value}");
                  }),
                  Obx(() {
                    if (controller.remainTime.value == -1) {
                      return const Text("Time remaining: ---");
                    }
                    return Text(
                        "Time remaining: ${controller.remainTime.value}s");
                  }),
                ]),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            onCancel();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
