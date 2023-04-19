import 'package:change_house_colors/shared/services/services.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PredictService());
  }
}
