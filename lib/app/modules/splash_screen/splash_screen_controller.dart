import 'package:flutter/cupertino.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  changeStatusColor() {
    FlutterStatusbarManager.setNavigationBarColor(Color(0xfff00),
        animated: true);
    FlutterStatusbarManager.setColor(Color(0xfff00), animated: true);
  }

  @override
  void onInit() {
    changeStatusColor();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
