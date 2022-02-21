// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

import 'dart:convert';

BlogsModel blogsModelFromJson(String str) => BlogsModel.fromJson(json.decode(str));

String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());

class BlogsModel {
    BlogsModel({
        this.validationErrors,
        this.hasError,
        this.message,
        this.data,
    });

    List<dynamic> ?validationErrors;
    bool? hasError;
    dynamic ?message;
    List<Datum>? data;

    factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
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
        this.content,
        this.image,
        this.categoryId,
        this.id,
    });

    String? title;
    String? content;
    String? image;
    String? categoryId;
    String? id;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["Title"] == null ? null : json["Title"],
        content: json["Content"] == null ? null : json["Content"],
        image: json["Image"] == null ? null : json["Image"],
        categoryId: json["CategoryId"] == null ? null : json["CategoryId"],
        id: json["Id"] == null ? null : json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title == null ? null : title,
        "Content": content == null ? null : content,
        "Image": image == null ? null : image,
        "CategoryId": categoryId == null ? null : categoryId,
        "Id": id == null ? null : id,
    };
}
