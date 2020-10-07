import 'package:dvina/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:dvina/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: SplashScreen(
        navigateAfterSeconds: Routes.HOME,
        seconds: 1,
        image: Image.asset(
          'assets/SplashScreen.png',
          fit: BoxFit.cover,
          height: Get.height,
          width: Get.width,
        ), //     child: ,
        loaderColor: Colors.red,
        loadingText: Text("جاري التحميل..."),
      ),
    );
  }
}
