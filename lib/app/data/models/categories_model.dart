// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        this.validationErrors,
        this.hasError,
        this.message,
        this.data,
    });

    List<dynamic> ?validationErrors;
    bool? hasError;
    dynamic ?message;
    List<Datum>? data;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        validationErrors: json["ValidationErrors"] == null ? null : List<dynamic>.from(json["ValidationErrors"].map((x) => x)),
        hasError: json["HasError"] == null ? null : json["HasError"],
        message: json["Message"],
        data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ValidationErrors": validationErrors == null ? null : List<dynamic>.from(validationErrors!.map((x) => x)),
        "HasError": hasError == null ? null : hasError,
        "Message": message,
        "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.title,
        this.image,
        this.id,
    });

    String? title;
    String? image;
    String ?id;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["Title"] == null ? null : json["Title"],
        image: json["Image"] == null ? null : json["Image"],
        id: json["Id"] == null ? null : json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "Image": image == null ? null : image,
        "Id": id == null ? null : id,
    };
}
