import 'dart:convert';

import 'package:dvina/app/modules/products/home_products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  //TODO: Implement ProductsController
  /***********************************VARS***********************************/

  /***********************************METHODS********************************/
  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  /************************************NETWORK*******************************/

  Future<HomeProducts> getHomeProducts() async {
    bool chosen = false;
    final response = await http.get(
      'http://dvinastore.com/index.php?route=api/home',
    );
    var res = utf8.decode(response.bodyBytes);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);

      return HomeProducts.fromJson(parsed);
      //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
    } else {
      throw Exception('asd');
    }
  }
}
