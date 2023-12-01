import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

class LoginModel {
  Data? data;

  LoginModel({
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  Otp? otp;

  Data({
    this.otp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"] == null ? null : Otp.fromJson(json["otp"]),
  );


}

class Otp {
  String? signature;
  Otp({
    this.signature,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
    signature: json["signature"],
  );

}
