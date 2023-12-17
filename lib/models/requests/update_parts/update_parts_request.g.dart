// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_parts_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePartsRequest _$UpdatePartsRequestFromJson(Map<String, dynamic> json) =>
    UpdatePartsRequest(
      langCode: json['langCode'] as String?,
      sellerCategory: json['sellerCategory'] == null
          ? null
          : UpdatePartsRequestSellerCategory.fromJson(
              json['sellerCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePartsRequestToJson(UpdatePartsRequest instance) =>
    <String, dynamic>{
      'langCode': instance.langCode,
      'sellerCategory': instance.sellerCategory,
    };

UpdatePartsRequestSellerCategory _$UpdatePartsRequestSellerCategoryFromJson(
        Map<String, dynamic> json) =>
    UpdatePartsRequestSellerCategory(
      sellerCategoryId: json['sellerCategoryId'] as int?,
      sellerCarModelId: json['sellerCarModelId'] as int?,
      categoryId: json['categoryId'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      isModified: json['isModified'] as bool?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UpdatePartsRequestSellerCategoryParts.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdatePartsRequestSellerCategoryToJson(
        UpdatePartsRequestSellerCategory instance) =>
    <String, dynamic>{
      'sellerCategoryId': instance.sellerCategoryId,
      'sellerCarModelId': instance.sellerCarModelId,
      'categoryId': instance.categoryId,
      'isDeleted': instance.isDeleted,
      'isModified': instance.isModified,
      'parts': instance.parts,
    };

UpdatePartsRequestSellerCategoryParts
    _$UpdatePartsRequestSellerCategoryPartsFromJson(
            Map<String, dynamic> json) =>
        UpdatePartsRequestSellerCategoryParts(
          partId: json['partId'] as int?,
          sellerCategoryId: json['sellerCategoryId'] as int?,
          sellerPartId: json['sellerPartId'] as int?,
          isDeleted: json['isDeleted'] as bool?,
          isModified: json['isModified'] as bool?,
          partAdditions: (json['partAdditions'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : UpdatePartsRequestSellerCategoryPartsPartAdditions.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$UpdatePartsRequestSellerCategoryPartsToJson(
        UpdatePartsRequestSellerCategoryParts instance) =>
    <String, dynamic>{
      'partId': instance.partId,
      'sellerCategoryId': instance.sellerCategoryId,
      'sellerPartId': instance.sellerPartId,
      'isDeleted': instance.isDeleted,
      'isModified': instance.isModified,
      'partAdditions': instance.partAdditions,
    };

UpdatePartsRequestSellerCategoryPartsPartAdditions
    _$UpdatePartsRequestSellerCategoryPartsPartAdditionsFromJson(
            Map<String, dynamic> json) =>
        UpdatePartsRequestSellerCategoryPartsPartAdditions(
          partAdditionId: json['partAdditionId'] as int?,
          sellerPartId: json['sellerPartId'] as int?,
          isDeleted: json['isDeleted'] as bool?,
          isModified: json['isModified'] as bool?,
          sellerPartAdditionId: json['sellerPartAdditionId'] as int?,
        );

Map<String, dynamic> _$UpdatePartsRequestSellerCategoryPartsPartAdditionsToJson(
        UpdatePartsRequestSellerCategoryPartsPartAdditions instance) =>
    <String, dynamic>{
      'partAdditionId': instance.partAdditionId,
      'sellerPartId': instance.sellerPartId,
      'isDeleted': instance.isDeleted,
      'isModified': instance.isModified,
      'sellerPartAdditionId': instance.sellerPartAdditionId,
    };
