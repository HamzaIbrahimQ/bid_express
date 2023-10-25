// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['ID'] as String?,
      coordinates: json['COORDINATES'] as String?,
      name: json['ADDRESS_NAME'] as String?,
      city: json['CITY'] as String?,
      area: json['AREA'] as String?,
      street: json['STREET'] as String?,
      building: json['BUILDING'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'ID': instance.id,
      'COORDINATES': instance.coordinates,
      'ADDRESS_NAME': instance.name,
      'CITY': instance.city,
      'AREA': instance.area,
      'STREET': instance.street,
      'BUILDING': instance.building,
    };
