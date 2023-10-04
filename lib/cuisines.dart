
import 'dart:convert';
CuisinesModel cuisinesModelFromJson(String str) => CuisinesModel.fromJson(json.decode(str));

String cuisinesModelToJson(CuisinesModel data) => json.encode(data.toJson());

class CuisinesModel {
  List<Datum>? data;

  CuisinesModel({
    this.data,
  });

  factory CuisinesModel.fromJson(Map<String, dynamic> json) => CuisinesModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  Attributes? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  Attributes({
    this.title,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    title: json["title"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
  };
}
