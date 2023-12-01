
import 'dart:convert';

ErrorResponseModel errorResponseModelFromJson(String str) => ErrorResponseModel.fromJson(json.decode(str));


class ErrorResponseModel {
  String? message;

  ErrorResponseModel({
    this.message,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
    message: json["message"],
  );


}
