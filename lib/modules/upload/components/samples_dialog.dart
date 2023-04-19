import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SamplesDialog extends StatelessWidget {
  const SamplesDialog(
      {super.key,
      required this.images,
      required this.onPress1,
      required this.onPress2});
  final List<String> images;

  final Function() onPress1;
  final Function() onPress2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pick one!"),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        InkWell(
            onTap: () {
              Get.back();
              onPress1();
            },
            child: Image.asset(images[0])),
        const SizedBox(
          height: 30,
        ),
        InkWell(
            onTap: () {
              Get.back();
              onPress2();
            },
            child: Image.asset(images[1])),
      ]),
      actions: [
        ElevatedButton(onPressed: Get.back, child: const Text("Cancel"))
      ],
    );
  }
}
