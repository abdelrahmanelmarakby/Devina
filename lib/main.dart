import 'package:dvina/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

TextStyle styleText = GoogleFonts.tajawal(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white,
          buttonColor: Colors.red,
          accentColor: Colors.red,
          textTheme: TextTheme(
            bodyText2: styleText,
            bodyText1: styleText,
            headline2: styleText,
          )),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
