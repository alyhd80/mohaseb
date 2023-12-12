// To parse this JSON data, do
//
//     final loginEndModel = loginEndModelFromJson(jsonString);

import 'dart:convert';

LoginEndModel loginEndModelFromJson(String str) => LoginEndModel.fromJson(json.decode(str));

String loginEndModelToJson(LoginEndModel data) => json.encode(data.toJson());

class LoginEndModel {
  Data? data;

  LoginEndModel({
    this.data,
  });

  factory LoginEndModel.fromJson(Map<String, dynamic> json) => LoginEndModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? token;

  Data({
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
