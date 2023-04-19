import 'package:change_house_colors/constants/network_constants.dart';
import 'package:change_house_colors/modules/result/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultMask extends GetView<ResultController> {
  const ResultMask({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "$networkHost/public/mask/${controller.maskUrl}",
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
