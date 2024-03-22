// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCarsResponse _$GetCarsResponseFromJson(Map<String, dynamic> json) =>
    GetCarsResponse(
      sellerBrandId: json['sellerBrandId'] as int?,
      brandId: json['brandId'] as int?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      sellerCarModels: (json['sellerCarModels'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetCarsResponseCarModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      carModelIdList: (json['carModelIdList'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$GetCarsResponseToJson(GetCarsResponse instance) =>
    <String, dynamic>{
      'sellerBrandId': instance.sellerBrandId,
      'brandId': instance.brandId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'sellerCarModels': instance.sellerCarModels,
      'carModelIdList': instance.carModelIdList,
      'isSelected': instance.isSelected,
    };

GetCarsResponseCarModels _$GetCarsResponseCarModelsFromJson(
        Map<String, dynamic> json) =>
    GetCarsResponseCarModels(
      sellerBrandId: json['sellerBrandId'] as int?,
      sellerCarModelId: json['sellerCarModelId'] as int?,
      carModelId: json['carModelId'] as int?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isSelected: json['isSelected'] as bool?,
      selectedCategoriesIds: (json['selectedCategoriesIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      yearFrom: json['yearFrom'] as String?,
      yearTo: json['yearTo'] as String?,
    );

Map<String, dynamic> _$GetCarsResponseCarModelsToJson(
        GetCarsResponseCarModels instance) =>
    <String, dynamic>{
      'sellerBrandId': instance.sellerBrandId,
      'sellerCarModelId': instance.sellerCarModelId,
      'carModelId': instance.carModelId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isSelected': instance.isSelected,
      'selectedCategoriesIds': instance.selectedCategoriesIds,
      'yearFrom': instance.yearFrom,
      'yearTo': instance.yearTo,
    };
