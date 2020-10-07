import 'dart:convert';

HomeProducts homeProductsFromJson(String str) =>
    HomeProducts.fromJson(json.decode(str));

String homeProductsToJson(HomeProducts data) => json.encode(data.toJson());

class HomeProducts {
  HomeProducts({
    this.mainBanners,
    this.banner1,
    this.banner2,
    this.mainCategories,
    this.buttonCart,
    this.buttonWishlist,
    this.buttonCompare,
    this.specialProducts,
    this.latestProducts,
    this.accessoriesCatName,
    this.accessoriesProducts,
    this.watchesCatName,
    this.watchesProducts,
    this.bagsCatName,
    this.bagsProducts,
  });

  List<Banner1> mainBanners;
  List<Banner1> banner1;
  List<Banner1> banner2;
  List<MainCategory> mainCategories;
  String buttonCart;
  String buttonWishlist;
  String buttonCompare;
  List<SpecialProduct> specialProducts;
  List<Product> latestProducts;
  String accessoriesCatName;
  List<Product> accessoriesProducts;
  String watchesCatName;
  List<Product> watchesProducts;
  String bagsCatName;
  List<Product> bagsProducts;

  factory HomeProducts.fromJson(Map<String, dynamic> json) => HomeProducts(
        mainBanners: List<Banner1>.from(
            json["main_banners"].map((x) => Banner1.fromJson(x))),
        banner1: List<Banner1>.from(
            json["banner_1"].map((x) => Banner1.fromJson(x))),
        banner2: List<Banner1>.from(
            json["banner_2"].map((x) => Banner1.fromJson(x))),
        mainCategories: List<MainCategory>.from(
            json["main_categories"].map((x) => MainCategory.fromJson(x))),
        buttonCart: json["button_cart"],
        buttonWishlist: json["button_wishlist"],
        buttonCompare: json["button_compare"],
        specialProducts: List<SpecialProduct>.from(
            json["special_products"].map((x) => SpecialProduct.fromJson(x))),
        latestProducts: List<Product>.from(
            json["latest_products"].map((x) => Product.fromJson(x))),
        accessoriesCatName: json["accessories_cat_name"],
        accessoriesProducts: List<Product>.from(
            json["accessories_products"].map((x) => Product.fromJson(x))),
        watchesCatName: json["watches_cat_name"],
        watchesProducts: List<Product>.from(
            json["watches_products"].map((x) => Product.fromJson(x))),
        bagsCatName: json["bags_cat_name"],
        bagsProducts: List<Product>.from(
            json["bags_products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "main_banners": List<dynamic>.from(mainBanners.map((x) => x.toJson())),
        "banner_1": List<dynamic>.from(banner1.map((x) => x.toJson())),
        "banner_2": List<dynamic>.from(banner2.map((x) => x.toJson())),
        "main_categories":
            List<dynamic>.from(mainCategories.map((x) => x.toJson())),
        "button_cart": buttonCart,
        "button_wishlist": buttonWishlist,
        "button_compare": buttonCompare,
        "special_products":
            List<dynamic>.from(specialProducts.map((x) => x.toJson())),
        "latest_products":
            List<dynamic>.from(latestProducts.map((x) => x.toJson())),
        "accessories_cat_name": accessoriesCatName,
        "accessories_products":
            List<dynamic>.from(accessoriesProducts.map((x) => x.toJson())),
        "watches_cat_name": watchesCatName,
        "watches_products":
            List<dynamic>.from(watchesProducts.map((x) => x.toJson())),
        "bags_cat_name": bagsCatName,
        "bags_products":
            List<dynamic>.from(bagsProducts.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId,
    this.thumb,
    this.name,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.href,
  });

  String productId;
  String thumb;
  Name name;
  String description;
  Price price;
  bool special;
  Price tax;
  String minimum;
  int rating;
  String href;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        thumb: json["thumb"],
        name: nameValues.map[json["name"]],
        description: json["description"],
        price: priceValues.map[json["price"]],
        special: json["special"],
        tax: priceValues.map[json["tax"]],
        minimum: json["minimum"],
        rating: json["rating"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "name": nameValues.reverse[name],
        "description": description,
        "price": priceValues.reverse[price],
        "special": special,
        "tax": priceValues.reverse[tax],
        "minimum": minimum,
        "rating": rating,
        "href": href,
      };
}

enum Name {
  RING_STUDDED_WITH_ZIRCON,
  GOLD_ALTERNATIVE_BRACELETS_4_PIECE,
  RING_DECORATED_WITH_ZIRCON_STONE,
  GOLD_SUBSTITUTE_BRACELETS_4_PIECE
}

final nameValues = EnumValues({
  "  Gold alternative bracelets 4 piece":
      Name.GOLD_ALTERNATIVE_BRACELETS_4_PIECE,
  "Gold substitute bracelets , 4 piece": Name.GOLD_SUBSTITUTE_BRACELETS_4_PIECE,
  "Ring decorated with zircon stone": Name.RING_DECORATED_WITH_ZIRCON_STONE,
  "Ring studded with zircon": Name.RING_STUDDED_WITH_ZIRCON
});

enum Price { THE_25, THE_27, THE_60, THE_18 }

final priceValues = EnumValues({
  "18 \u0024": Price.THE_18,
  "25 \u0024": Price.THE_25,
  "27 \u0024": Price.THE_27,
  "60 \u0024": Price.THE_60
});

class Banner1 {
  Banner1({
    this.title,
    this.link,
    this.image,
  });

  String title;
  String link;
  String image;

  factory Banner1.fromJson(Map<String, dynamic> json) => Banner1(
        title: json["title"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "image": image,
      };
}

class MainCategory {
  MainCategory({
    this.categoryId,
    this.name,
    this.image,
  });

  String categoryId;
  String name;
  String image;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "image": image,
      };
}

class SpecialProduct {
  SpecialProduct({
    this.productId,
    this.thumb,
    this.name,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.href,
  });

  String productId;
  String thumb;
  String name;
  String description;
  String price;
  String special;
  String tax;
  String minimum;
  int rating;
  String href;

  factory SpecialProduct.fromJson(Map<String, dynamic> json) => SpecialProduct(
        productId: json["product_id"],
        thumb: json["thumb"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        special: json["special"],
        tax: json["tax"],
        minimum: json["minimum"],
        rating: json["rating"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "name": name,
        "description": description,
        "price": price,
        "special": special,
        "tax": tax,
        "minimum": minimum,
        "rating": rating,
        "href": href,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
