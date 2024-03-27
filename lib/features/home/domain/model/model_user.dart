// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'model_user.g.dart';

List<ModelUser> modelUserFromJson(String str) =>
    List<ModelUser>.from(json.decode(str).map((x) => ModelUser.fromJson(x)));

String modelUserToJson(List<ModelUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ModelUser {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "query")
  String? query;

  ModelUser({
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
    this.id,
    this.query,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) =>
      _$ModelUserFromJson(json);

  Map<String, dynamic> toJson() => _$ModelUserToJson(this);
}
