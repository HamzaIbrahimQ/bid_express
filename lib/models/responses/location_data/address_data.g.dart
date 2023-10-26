// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      stateDistrict: json['state_district'] as String?,
      suburb: json['suburb'] as String?,
      road: json['road'] as String?,
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'country': instance.country,
      'country_code': instance.countryCode,
      'state': instance.state,
      'city': instance.city,
      'neighbourhood': instance.neighbourhood,
      'state_district': instance.stateDistrict,
      'suburb': instance.suburb,
      'road': instance.road,
    };
