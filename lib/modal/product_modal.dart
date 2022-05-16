// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

List<ProductData> productDataFromJson(String str) => List<ProductData>.from(json.decode(str).map((x) => ProductData.fromJson(x)));

String productDataToJson(List<ProductData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductData {
  ProductData({
    this.id,
    this.price,
    this.picture,
    this.colors,
    this.productName,
    this.brands,
  });

  String? id;
  String? price;
  String? picture;
  List<Color>? colors;
  String? productName;
  List<Brand>? brands;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["_id"],
    price: json["price"],
    picture: json["picture"],
    colors: List<Color>.from(json["colors"].map((x) => colorValues.map[x])),
    productName: json["productName"],
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "price": price,
    "picture": picture,
    "colors": List<dynamic>.from(colors!.map((x) => colorValues.reverse[x])),
    "productName": productName,
    "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
  };
}

class Brand {
  Brand({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

enum Color { RED, BLUE, GREEN }

final colorValues = EnumValues({
  "Blue": Color.BLUE,
  "Green": Color.GREEN,
  "Red": Color.RED
});

class EnumValues<T> {
  Map<String, T> map;
 late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
