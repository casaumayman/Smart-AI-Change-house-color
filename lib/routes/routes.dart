import 'package:change_house_colors/modules/result/result.dart';
import 'package:change_house_colors/modules/upload/decorate.dart';
import 'package:change_house_colors/modules/splash/splash.dart';
import 'package:get/get.dart';

class Routes {
  static const decorate = '/decorate';
  static const results = '/results';

  static List<GetPage> pages = [
    GetPage(
        name: '/',
        page: () => const SplashScreen(),
        binding: BindingsBuilder(() {
          Get.put(SplashController());
        })),
    GetPage(
        name: decorate,
        page: () => const DecorateScreen(),
        binding: DecorateBinding()),
    GetPage(
        name: results,
        page: () => const ResultScreen(),
        binding: ResultBinding()),
  ];
}
