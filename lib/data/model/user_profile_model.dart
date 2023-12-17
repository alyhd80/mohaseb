// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  Data? data;

  UserProfileModel({
    this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? avatar;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  DateTime? birthDate;
  Education? gender;
  Education? education;
  Socials? socials;
  Location? location;

  Data({
    this.id,
    this.avatar,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.birthDate,
    this.gender,
    this.education,
    this.socials,
    this.location,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    avatar: json["avatar"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
    gender: json["gender"] == null ? null : Education.fromJson(json["gender"]),
    education: json["education"] == null ? null : Education.fromJson(json["education"]),
    socials: json["socials"] == null ? null : Socials.fromJson(json["socials"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "birth_date": birthDate?.toIso8601String(),
    "gender": gender?.toJson(),
    "education": education?.toJson(),
    "socials": socials?.toJson(),
    "location": location?.toJson(),
  };
}

class Education {
  int? id;
  String? name;

  Education({
    this.id,
    this.name,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Location {
  String? address;
  int? longitude;
  int? latitude;
  Education? city;
  StateId? stateId;

  Location({
    this.address,
    this.longitude,
    this.latitude,
    this.city,
    this.stateId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    city: json["city"] == null ? null : Education.fromJson(json["city"]),
    stateId: json["state_id"] == null ? null : StateId.fromJson(json["state_id"]),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "city": city?.toJson(),
    "state_id": stateId?.toJson(),
  };
}

class StateId {
  int? id;
  String? name;
  String? code;

  StateId({
    this.id,
    this.name,
    this.code,
  });

  factory StateId.fromJson(Map<String, dynamic> json) => StateId(
    id: json["id"],
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}

class Socials {
  String? whatsapp;
  String? linkedin;
  String? telegram;
  String? instagram;

  Socials({
    this.whatsapp,
    this.linkedin,
    this.telegram,
    this.instagram,
  });

  factory Socials.fromJson(Map<String, dynamic> json) => Socials(
    whatsapp: json["whatsapp"],
    linkedin: json["linkedin"],
    telegram: json["telegram"],
    instagram: json["instagram"],
  );

  Map<String, dynamic> toJson() => {
    "whatsapp": whatsapp,
    "linkedin": linkedin,
    "telegram": telegram,
    "instagram": instagram,
  };
}
