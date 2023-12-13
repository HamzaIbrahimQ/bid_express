// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartResponse _$PartResponseFromJson(Map<String, dynamic> json) => PartResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$PartResponseToJson(PartResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'imageUrl': instance.imageUrl,
    };
