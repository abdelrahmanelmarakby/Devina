import 'package:get/get.dart';

import 'package:dvina/app/modules/intro/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(),
    );
  }
}
