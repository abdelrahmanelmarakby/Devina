import 'package:dvina/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
    );
  }
}
