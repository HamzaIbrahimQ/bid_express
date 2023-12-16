// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCarsResponse _$GetCarsResponseFromJson(Map<String, dynamic> json) =>
    GetCarsResponse(
      json['sellerBrandId'] as int?,
      json['brandId'] as int?,
      json['name'] as String?,
      json['imageUrl'] as String?,
      (json['sellerCarModels'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetCarsResponseCarModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['carModelIdList'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
    );

Map<String, dynamic> _$GetCarsResponseToJson(GetCarsResponse instance) =>
    <String, dynamic>{
      'sellerBrandId': instance.sellerBrandId,
      'brandId': instance.brandId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'sellerCarModels': instance.sellerCarModels,
      'carModelIdList': instance.carModelIdList,
    };

GetCarsResponseCarModels _$GetCarsResponseCarModelsFromJson(
        Map<String, dynamic> json) =>
    GetCarsResponseCarModels(
      json['sellerBrandId'] as int?,
      json['sellerCarModelId'] as int?,
      json['carModelId'] as int?,
      json['name'] as String?,
      json['imageUrl'] as String?,
    );

Map<String, dynamic> _$GetCarsResponseCarModelsToJson(
        GetCarsResponseCarModels instance) =>
    <String, dynamic>{
      'sellerBrandId': instance.sellerBrandId,
      'sellerCarModelId': instance.sellerCarModelId,
      'carModelId': instance.carModelId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
