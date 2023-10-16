
import 'dart:convert';

RestaurantResponse restaurantInsertModelFromJson(String str) => RestaurantResponse.fromJson(json.decode(str));
String restaurantInsertModelToJson(RestaurantResponse data) => json.encode(data.toJson());
class RestaurantResponse {
  Data? data;
  RestaurantResponse({
    this.data,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) => RestaurantResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? category;
  int? discount;
  double? deliveryFee;
  int? deliveryTime;
  String? picture;
  Data({
    this.name,
    this.category,
    this.discount,
    this.deliveryFee,
    this.deliveryTime,
    this.picture,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    category: json["category"],
    discount: json["discount"],
    deliveryFee: json["deliveryFee"]?.toDouble(),
    deliveryTime: json["deliveryTime"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "category": category,
    "discount": discount,
    "deliveryFee": deliveryFee,
    "deliveryTime": deliveryTime,
    "picture": picture,
  };
}
