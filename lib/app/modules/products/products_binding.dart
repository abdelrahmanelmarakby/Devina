import 'package:get/get.dart';

import 'package:dvina/app/modules/products/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(),
    );
  }
}
