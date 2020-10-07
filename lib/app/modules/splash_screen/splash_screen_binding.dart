import 'package:get/get.dart';

import 'package:dvina/app/modules/splash_screen/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
    );
  }
}
