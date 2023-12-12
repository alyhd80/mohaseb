// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? hasPassword;
  bool? otpSent;
  Data? data;

  LoginModel({
    this.hasPassword,
    this.otpSent,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    hasPassword: json["has_password"],
    otpSent: json["OTP_sent"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "has_password": hasPassword,
    "OTP_sent": otpSent,
    "data": data?.toJson(),
  };
}

class Data {
  Otp? otp;

  Data({
    this.otp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"] == null ? null : Otp.fromJson(json["otp"]),
  );

  Map<String, dynamic> toJson() => {
    "otp": otp?.toJson(),
  };
}

class Otp {
  String? signature;
  DateTime? createdAt;
  DateTime? expiredAt;

  Otp({
    this.signature,
    this.createdAt,
    this.expiredAt,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
    signature: json["signature"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
  );

  Map<String, dynamic> toJson() => {
    "signature": signature,
    "created_at": createdAt?.toIso8601String(),
    "expired_at": expiredAt?.toIso8601String(),
  };
}
