// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_categories_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCategoriesRequest _$AddCategoriesRequestFromJson(
        Map<String, dynamic> json) =>
    AddCategoriesRequest(
      sellerId: json['sellerId'] as int? ?? 0,
      tempSellerId: json['tempSellerId'] as int? ?? 0,
      langCode: json['langCode'] as String? ?? 'en',
      sellerCategories: (json['sellerCategories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddCategoriesRequestSellerCategories.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddCategoriesRequestToJson(
        AddCategoriesRequest instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'tempSellerId': instance.tempSellerId,
      'langCode': instance.langCode,
      'sellerCategories': instance.sellerCategories,
    };

AddCategoriesRequestSellerCategories
    _$AddCategoriesRequestSellerCategoriesFromJson(Map<String, dynamic> json) =>
        AddCategoriesRequestSellerCategories(
          categoryId: json['categoryId'] as int?,
          sellerCarModelId: json['sellerCarModelId'] as int?,
          fromYear: json['fromYear'] as int?,
          toYear: json['toYear'] as int?,
          parts: (json['parts'] as List<dynamic>?)
                  ?.map((e) => e == null
                      ? null
                      : AddCategoriesRequestSellerCategoriesParts.fromJson(
                          e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$AddCategoriesRequestSellerCategoriesToJson(
        AddCategoriesRequestSellerCategories instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'sellerCarModelId': instance.sellerCarModelId,
      'fromYear': instance.fromYear,
      'toYear': instance.toYear,
      'parts': instance.parts,
    };

AddCategoriesRequestSellerCategoriesParts
    _$AddCategoriesRequestSellerCategoriesPartsFromJson(
            Map<String, dynamic> json) =>
        AddCategoriesRequestSellerCategoriesParts(
          partId: json['partId'] as int?,
          partAdditions: (json['partAdditions'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : AddCategoriesRequestSellerCategoriesPartsPartAdditions
                      .fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$AddCategoriesRequestSellerCategoriesPartsToJson(
        AddCategoriesRequestSellerCategoriesParts instance) =>
    <String, dynamic>{
      'partId': instance.partId,
      'partAdditions': instance.partAdditions,
    };

AddCategoriesRequestSellerCategoriesPartsPartAdditions
    _$AddCategoriesRequestSellerCategoriesPartsPartAdditionsFromJson(
            Map<String, dynamic> json) =>
        AddCategoriesRequestSellerCategoriesPartsPartAdditions(
          partAdditionId: json['partAdditionId'] as int?,
        );

Map<String, dynamic>
    _$AddCategoriesRequestSellerCategoriesPartsPartAdditionsToJson(
            AddCategoriesRequestSellerCategoriesPartsPartAdditions instance) =>
        <String, dynamic>{
          'partAdditionId': instance.partAdditionId,
        };
