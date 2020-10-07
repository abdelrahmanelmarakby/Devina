import 'package:dvina/app/modules/products/products_view.dart';
import 'package:dvina/app/modules/products/products_binding.dart';
import 'package:dvina/app/modules/home/home_binding.dart';
import 'package:dvina/app/modules/home/home_view.dart';
import 'package:dvina/app/modules/intro/intro_binding.dart';
import 'package:dvina/app/modules/intro/intro_view.dart';
import 'package:dvina/app/modules/splash_screen/splash_screen_binding.dart';
import 'package:dvina/app/modules/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTS, 
      page:()=> ProductsView(), 
      binding: ProductsBinding(),
    ),
  ];
}