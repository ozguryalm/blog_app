// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        this.validationErrors,
        this.hasError,
        this.message,
        this.data,
    });

    List<ValidationError> ?validationErrors;
    bool? hasError;
    dynamic ?message;
    Data ?data;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        validationErrors: json["ValidationErrors"] == null ? null : List<ValidationError>.from(json["ValidationErrors"].map((x) => ValidationError.fromJson(x))),
        hasError: json["HasError"] == null ? null : json["HasError"],
        message: json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "ValidationErrors": validationErrors == null ? null : List<dynamic>.from(validationErrors!.map((x) => x.toJson())),
        "HasError": hasError == null ? null : hasError,
        "Message": message,
        "Data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.token,
    });

    String ?token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["Token"] == null ? null : json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "Token": token == null ? null : token,
    };
}

class ValidationError {
    ValidationError({
        this.key,
        this.value,
    });

    String? key;
    String ?value;

    factory ValidationError.fromJson(Map<String, dynamic> json) => ValidationError(
        key: json["Key"] == null ? null : json["Key"],
        value: json["Value"] == null ? null : json["Value"],
    );

    Map<String, dynamic> toJson() => {
        "Key": key == null ? null : key,
        "Value": value == null ? null : value,
    };
}
