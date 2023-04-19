import 'package:change_house_colors/modules/result/result_controller.dart';
import 'package:get/get.dart';

class ResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResultController());
  }
}
