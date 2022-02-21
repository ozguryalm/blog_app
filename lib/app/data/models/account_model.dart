// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
    AccountModel({
        this.validationErrors,
        this.hasError,
        this.message,
        this.data,
    });

    List<dynamic>? validationErrors;
    bool? hasError;
    dynamic message;
    Data? data;

    factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        validationErrors: json["ValidationErrors"] == null ? null : List<dynamic>.from(json["ValidationErrors"].map((x) => x)),
        hasError: json["HasError"] == null ? null : json["HasError"],
        message: json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "ValidationErrors": validationErrors == null ? null : List<dynamic>.from(validationErrors!.map((x) => x)),
        "HasError": hasError == null ? null : hasError,
        "Message": message,
        "Data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.email,
        this.image,
        this.location,
        this.favoriteBlogIds,
    });

    String? id;
    String? email;
    dynamic image;
    dynamic location;
    List<String>? favoriteBlogIds;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"] == null ? null : json["Id"],
        email: json["Email"] == null ? null : json["Email"],
        image: json["Image"],
        location: json["Location"],
        favoriteBlogIds: json["FavoriteBlogIds"] == null ? null : List<String>.from(json["FavoriteBlogIds"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Email": email == null ? null : email,
        "Image": image,
        "Location": location,
        "FavoriteBlogIds": favoriteBlogIds == null ? null : List<dynamic>.from(favoriteBlogIds!.map((x) => x)),
    };
}
