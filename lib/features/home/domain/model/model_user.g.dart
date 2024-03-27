// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelUser _$ModelUserFromJson(Map<String, dynamic> json) => ModelUser(
      name: json['name'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      city: json['city'] as String?,
      id: json['id'] as String?,
      query: json['query'] as String?,
    );

Map<String, dynamic> _$ModelUserToJson(ModelUser instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'id': instance.id,
      'query': instance.query,
    };
