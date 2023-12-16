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
      isSelected: json['isSelected'] as bool?,
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => CarModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      myModels: (json['myModels'] as List<dynamic>?)
          ?.map((e) => CarModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchList: (json['searchList'] as List<dynamic>?)
          ?.map((e) => CarModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      myModelsSearchList: (json['myModelsSearchList'] as List<dynamic>?)
          ?.map((e) => CarModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarBrandResponseToJson(CarBrandResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
      'isSelected': instance.isSelected,
      'models': instance.models,
      'myModels': instance.myModels,
      'searchList': instance.searchList,
      'myModelsSearchList': instance.myModelsSearchList,
    };
