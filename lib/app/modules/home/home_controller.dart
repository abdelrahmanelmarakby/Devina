import 'dart:convert';

import 'package:dvina/app/modules/home/lang_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  /***********************************VARs*******************************************/
  String countrycode;
  RxBool buttonEnabled = true.obs;
  String langCode;
  /**********************************METHODS*****************************************/

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  switchButton() {
    buttonEnabled.value = !buttonEnabled.value;
    update();
  }

  /**************************************NETWORK******************************/
  Future<Lang> getCountry() async {
    bool chosen = false;
    final response = await http.get(
      'http://dvinastore.com/index.php?route=api/header/setLangCountry',
    );
    var res = utf8.decode(response.bodyBytes);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);

      return Lang.fromJson(parsed);
      //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
    } else {
      throw Exception('asd');
    }
  }

  Future<Lang> setCountry(String id, String code) async {
    bool chosen = false;
    final response = await http.post(
        'http://dvinastore.com/index.php?route=api/header/setLangCountry',
        body: {"country_id": id, "code": code});
    var res = utf8.decode(response.bodyBytes);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);

      return Lang.fromJson(parsed);
      //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
    } else {
      throw Exception('asd');
    }
  }
}
