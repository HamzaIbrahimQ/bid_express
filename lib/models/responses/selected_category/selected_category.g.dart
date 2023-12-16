// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedCategory _$SelectedCategoryFromJson(Map<String, dynamic> json) =>
    SelectedCategory(
      json['sellerCarModelId'] as int?,
      json['sellerCategoryId'] as int?,
      json['categoryId'] as int?,
      json['name'] as String?,
      json['imageUrl'] as String?,
      (json['parts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SelectedCategoryPart.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['partIdList'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$SelectedCategoryToJson(SelectedCategory instance) =>
    <String, dynamic>{
      'sellerCarModelId': instance.sellerCarModelId,
      'sellerCategoryId': instance.sellerCategoryId,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'parts': instance.parts,
      'partIdList': instance.partIdList,
    };

SelectedCategoryPart _$SelectedCategoryPartFromJson(
        Map<String, dynamic> json) =>
    SelectedCategoryPart(
      json['partId'] as int?,
      json['sellerCategoryId'] as int?,
      json['sellerPartId'] as int?,
      json['name'] as String?,
      json['imageUrl'] as String?,
      (json['partAdditions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SelectedCategoryPartAdditions.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      (json['partAdditionIdList'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
    );

Map<String, dynamic> _$SelectedCategoryPartToJson(
        SelectedCategoryPart instance) =>
    <String, dynamic>{
      'partId': instance.partId,
      'sellerCategoryId': instance.sellerCategoryId,
      'sellerPartId': instance.sellerPartId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'partAdditions': instance.partAdditions,
      'partAdditionIdList': instance.partAdditionIdList,
    };

SelectedCategoryPartAdditions _$SelectedCategoryPartAdditionsFromJson(
        Map<String, dynamic> json) =>
    SelectedCategoryPartAdditions(
      json['partAdditionId'] as int?,
      json['sellerPartId'] as int?,
      json['sellerPartAdditionId'] as int?,
      json['name'] as String?,
      json['imageUrl'] as String?,
    );

Map<String, dynamic> _$SelectedCategoryPartAdditionsToJson(
        SelectedCategoryPartAdditions instance) =>
    <String, dynamic>{
      'partAdditionId': instance.partAdditionId,
      'sellerPartId': instance.sellerPartId,
      'sellerPartAdditionId': instance.sellerPartAdditionId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
