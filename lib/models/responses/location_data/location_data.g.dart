// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      placeId: json['place_id'] as int?,
      lat: json['lat'] as String?,
      long: json['lon'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      addressData: json['address'] == null
          ? null
          : AddressData.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'lat': instance.lat,
      'lon': instance.long,
      'name': instance.name,
      'display_name': instance.displayName,
      'address': instance.addressData,
    };
