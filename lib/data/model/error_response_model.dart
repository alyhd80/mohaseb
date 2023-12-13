// To parse this JSON data, do
//
//     final errorResponseModel = errorResponseModelFromJson(jsonString);

import 'dart:convert';

ErrorResponseModel errorResponseModelFromJson(String str) => ErrorResponseModel.fromJson(json.decode(str));

String errorResponseModelToJson(ErrorResponseModel data) => json.encode(data.toJson());

class ErrorResponseModel {
  String? message;
  Errors? errors;

  ErrorResponseModel({
    this.message,
    this.errors,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
    message: json["message"],
    errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors?.toJson(),
  };
}

class Errors {
  List<String>? password;

  Errors({
    this.password,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "password": password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
  };
}
