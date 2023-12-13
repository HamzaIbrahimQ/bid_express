// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_addition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartAdditionResponse _$PartAdditionResponseFromJson(
        Map<String, dynamic> json) =>
    PartAdditionResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$PartAdditionResponseToJson(
        PartAdditionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
    };
