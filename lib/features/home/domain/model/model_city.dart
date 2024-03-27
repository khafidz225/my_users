// To parse this JSON data, do
//
//     final modelCity = modelCityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'model_city.g.dart';

List<ModelCity> modelCityFromJson(String str) =>
    List<ModelCity>.from(json.decode(str).map((x) => ModelCity.fromJson(x)));

String modelCityToJson(List<ModelCity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ModelCity {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  String? id;

  ModelCity({
    this.name,
    this.id,
  });

  factory ModelCity.fromJson(Map<String, dynamic> json) =>
      _$ModelCityFromJson(json);

  Map<String, dynamic> toJson() => _$ModelCityToJson(this);
}
