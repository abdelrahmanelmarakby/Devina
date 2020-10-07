import 'package:carousel_pro/carousel_pro.dart';
import 'package:dvina/app/modules/products/home_products_model.dart';
import 'package:dvina/app/modules/products/products_controller.dart';
import 'package:dvina/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: GestureDetector(
              child: Icon(
                Icons.search,
                size: 24,
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: GestureDetector(
          child: Image.asset(
            'assets/D.png',
            fit: BoxFit.scaleDown,
            height: Get.height / 14,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<HomeProducts>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeProducts products = snapshot.data;
            return ListView(
              children: [
                Container(
                  height: Get.height / 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Carousel(
                      showIndicator: true,
                      borderRadius: true,
                      dotBgColor: Colors.transparent,
                      dotColor: Colors.red,
                      indicatorBgPadding: 6,
                      dotVerticalPadding: 0,
                      dotSize: 4,
                      dotIncreaseSize: 2,
                      radius: Radius.circular(20),
                      overlayShadow: false,
                      boxFit: BoxFit.fitWidth,
                      autoplayDuration: Duration(seconds: 2),
                      autoplay: true,
                      images: List.generate(
                          products.banner1.length,
                          (index) =>
                              NetworkImage(products.banner1[index].image)),
                    ),
                  ),
                ),
                Container(
                  height: products.mainCategories.length > 3
                      ? Get.height / 2.5
                      : Get.height / 4.7,
                  child: GridView.count(
                    primary: false,
                    crossAxisCount: 3,
                    childAspectRatio: (Get.height / 10) / (Get.width / 4.2),
                    children: List.generate(
                        products.mainCategories.length,
                        (index) => GestureDetector(
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                color: mainColor,
                                shadowColor: Colors.red.shade900,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            topLeft: Radius.circular(12)),
                                        child: Image.network(
                                          products.mainCategories[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: Get.height / 18,
                                      decoration: BoxDecoration(
                                          color: accentColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight:
                                                  Radius.circular(12))),
                                      width: Get.width,
                                      child: Center(
                                        child: Text(
                                          products.mainCategories[index].name,
                                          style: TextStyle(color: mainColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 16,
                        color: Colors.red.shade100,
                        thickness: 3,
                        // endIndent: Get.width / 2.4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("الاكثر مبيعا"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 3,
                        height: 2,
                        color: Colors.red.shade100,
                        // endIndent: Get.width / 2.4,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: Get.height / 1.5,
                  child: GridView.count(
                    primary: false,
                    semanticChildCount: 4,
                    crossAxisCount: 2,
                    childAspectRatio: (Get.width / 6) / (Get.height / 10),
                    children: List.generate(
                        products.specialProducts.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  elevation: 8,
                                  shadowColor: Colors.red,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight:
                                                      Radius.circular(12)),
                                              child: Image.network(
                                                products.specialProducts[index]
                                                    .thumb,
                                                height: Get.height / 8,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(products
                                                .specialProducts[index].name),
                                          ),
                                          Text(products
                                              .specialProducts[index].price),
                                          Container(
                                            height: Get.height / 18,
                                            decoration: BoxDecoration(
                                                color: accentColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12))),
                                            width: Get.width,
                                            child: Center(
                                              child: Text(
                                                products
                                                    .mainCategories[index].name,
                                                style:
                                                    TextStyle(color: mainColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: accentColor,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    width: defaultButtonWidth,
                    height: buttonHeight,
                    child: RaisedButton(
                      onPressed: () {},
                      color: accentColor,
                      child: Text(
                        /*TODO:add Show More button*/ "TODO",
                        style: GoogleFonts.tajawal(color: mainColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height / 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Carousel(
                      showIndicator: true,
                      borderRadius: true,
                      dotBgColor: Colors.transparent,
                      dotColor: Colors.red,
                      indicatorBgPadding: 6,
                      dotVerticalPadding: 0,
                      dotSize: 4,
                      dotIncreaseSize: 2,
                      radius: Radius.circular(20),
                      overlayShadow: false,
                      boxFit: BoxFit.fitWidth,
                      autoplayDuration: Duration(seconds: 2),
                      autoplay: true,
                      images: List.generate(
                          products.banner2.length,
                          (index) =>
                              NetworkImage(products.banner2[index].image)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 16,
                          color: Colors.red.shade100,
                          thickness: 3,
                          // endIndent: Get.width / 2.4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("المضاف اخيرا"),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          height: 2,
                          color: Colors.red.shade100,
                          // endIndent: Get.width / 2.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height / 1.5,
                  child: GridView.count(
                    primary: false,
                    semanticChildCount: 4,
                    crossAxisCount: 2,
                    childAspectRatio: (Get.width / 6) / (Get.height / 10),
                    children: List.generate(
                        products.specialProducts.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  elevation: 8,
                                  shadowColor: Colors.red,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight:
                                                      Radius.circular(12)),
                                              child: Image.network(
                                                products.specialProducts[index]
                                                    .thumb,
                                                height: Get.height / 8,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(products
                                                .specialProducts[index].name),
                                          ),
                                          Text(products
                                              .specialProducts[index].price),
                                          Container(
                                            height: Get.height / 18,
                                            decoration: BoxDecoration(
                                                color: accentColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12))),
                                            width: Get.width,
                                            child: Center(
                                              child: Text(
                                                products
                                                    .mainCategories[index].name,
                                                style:
                                                    TextStyle(color: mainColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: accentColor,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    width: defaultButtonWidth,
                    height: buttonHeight,
                    child: RaisedButton(
                      onPressed: () {},
                      color: accentColor,
                      child: Text(
                        /*TODO:add Show More button*/ "TODO",
                        style: GoogleFonts.tajawal(color: mainColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ));
          }
        },
        future: controller.getHomeProducts(),
      ),
    );
  }
}
