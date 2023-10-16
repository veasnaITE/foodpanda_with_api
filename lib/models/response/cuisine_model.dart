// To parse this JSON data, do
//
//     final cuisineModel = cuisineModelFromJson(jsonString);

import 'dart:convert';

CuisineModel cuisineModelFromJson(String str) => CuisineModel.fromJson(json.decode(str));

String cuisineModelToJson(CuisineModel data) => json.encode(data.toJson());

class CuisineModel {
  List<CuisineData>? data;

  CuisineModel({
    this.data,
  });

  factory CuisineModel.fromJson(Map<String, dynamic> json) => CuisineModel(
    data: json["data"] == null ? [] : List<CuisineData>.from(json["data"]!.map((x) => CuisineData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CuisineData {
  int? id;
  DatumAttributes? attributes;

  CuisineData({
    this.id,
    this.attributes,
  });

  factory CuisineData.fromJson(Map<String, dynamic> json) => CuisineData(
    id: json["id"],
    attributes: json["attributes"] == null ? null : DatumAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class DatumAttributes {
  String? title;
  AttributesThumbnail? thumbnail;

  DatumAttributes({
    this.title,
    this.thumbnail,
  });

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    title: json["title"],
    thumbnail: json["thumbnail"] == null ? null : AttributesThumbnail.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumbnail": thumbnail?.toJson(),
  };
}

class AttributesThumbnail {
  Data? data;

  AttributesThumbnail({
    this.data,
  });

  factory AttributesThumbnail.fromJson(Map<String, dynamic> json) => AttributesThumbnail(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  DataAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    attributes: json["attributes"] == null ? null : DataAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class DataAttributes {
  String? name;
  Formats? formats;

  DataAttributes({
    this.name,
    this.formats,
  });

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
    name: json["name"],
    formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "formats": formats?.toJson(),
  };
}

class Formats {
  FormatsThumbnail? thumbnail;

  Formats({
    this.thumbnail,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    thumbnail: json["thumbnail"] == null ? null : FormatsThumbnail.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail?.toJson(),
  };
}

class FormatsThumbnail {
  String? url;

  FormatsThumbnail({
    this.url,
  });

  factory FormatsThumbnail.fromJson(Map<String, dynamic> json) => FormatsThumbnail(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
