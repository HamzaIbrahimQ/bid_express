// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModelResponse _$CarModelResponseFromJson(Map<String, dynamic> json) =>
    CarModelResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$CarModelResponseToJson(CarModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
      'isSelected': instance.isSelected,
    };
