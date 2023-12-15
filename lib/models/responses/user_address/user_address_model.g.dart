// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['id'] as int?,
      addressName: json['addressName'] as String?,
      city: json['city'] as String?,
      area: json['area'] as String?,
      street: json['street'] as String?,
      longitude: json['longitude'] as double?,
      latitude: json['latitude'] as double?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressName': instance.addressName,
      'city': instance.city,
      'area': instance.area,
      'street': instance.street,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
