import 'package:dvina/app/modules/home/home_controller.dart';
import 'package:dvina/app/modules/home/lang_model.dart';
import 'package:dvina/app/routes/app_pages.dart';
import 'package:dvina/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: Get.height / 8,
          ),
          Image.asset(
            'assets/logo.png',
            width: Get.width / 2,
            height: Get.height / 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, bottom: 3),
            child: Center(child: Text("قم باختيار وجهة الشحن الخاصة بك")),
          ),
          FutureBuilder<Lang>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Lang countries = snapshot.data;
                return Container(
                  height: Get.height / 2.5,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20, top: 0, bottom: 25),
                        child: Container(
                          height: buttonHeight,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: ListView.builder(
                                        itemCount: countries.countries.length,
                                        itemBuilder: (context, index) =>
                                            FlatButton(
                                                onPressed: () {
                                                  controller.countrycode =
                                                      countries.countries[index]
                                                          .countryId;
                                                  Get.back();
                                                },
                                                child: Text(
                                                  countries
                                                      .countries[index].name,
                                                  style: GoogleFonts.tajawal(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: accentColor),
                                                )),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "اختر الدولة",
                              style: GoogleFonts.tajawal(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "قم باختيار اللغة المفضلة",
                          style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: defaultButtonWidth,
                              height: buttonHeight,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                    side: BorderSide(color: Colors.red)),
                                child: Text(
                                  "العربية",
                                  style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w600),
                                ),
                                color: controller.buttonEnabled.value == false
                                    ? accentColor
                                    : mainColor,
                                onPressed: () {
                                  controller.switchButton();
                                  controller.langCode =
                                      countries.languages[0].code;
                                  print(controller.langCode +
                                      controller.buttonEnabled.value
                                          .toString());
                                },
                              ),
                            ),
                            Container(
                              width: defaultButtonWidth,
                              height: buttonHeight,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                    side: BorderSide(color: Colors.red)),
                                child: Text("English",
                                    style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w600)),
                                color: controller.buttonEnabled.value == true
                                    ? accentColor
                                    : mainColor,
                                onPressed: () {
                                  controller.switchButton();
                                  controller.langCode =
                                      countries.languages[1].code;
                                  print(controller.langCode +
                                      controller.buttonEnabled.value
                                          .toString());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                          left: 20,
                        ),
                        child: Container(
                          width: defaultButtonWidth,
                          height: buttonHeight,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                side: BorderSide(color: Colors.red)),
                            child: Text("متابعة",
                                style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w600)),
                            color: accentColor,
                            onPressed: () {
                              controller.setCountry(
                                  controller.countrycode, controller.langCode);
                              Get.offNamed(Routes.PRODUCTS);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
            future: controller.getCountry(),
          ),
        ],
      ),
    );
  }
}
