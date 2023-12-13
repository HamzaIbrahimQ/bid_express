// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_brand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarBrandResponse _$CarBrandResponseFromJson(Map<String, dynamic> json) =>
    CarBrandResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CarBrandResponseToJson(CarBrandResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
    };
