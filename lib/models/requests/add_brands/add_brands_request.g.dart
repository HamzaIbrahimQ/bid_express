// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_brands_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBrandsRequest _$AddBrandsRequestFromJson(Map<String, dynamic> json) =>
    AddBrandsRequest(
      langCode: json['langCode'] as String,
      sellerCreateBrand: (json['sellerCreateBrand'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddBrandRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddBrandsRequestToJson(AddBrandsRequest instance) =>
    <String, dynamic>{
      'langCode': instance.langCode,
      'sellerCreateBrand': instance.sellerCreateBrand,
    };

AddBrandRequest _$AddBrandRequestFromJson(Map<String, dynamic> json) =>
    AddBrandRequest(
      brandId: json['brandId'] as int?,
      sellerCarModels: (json['sellerCarModels'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddBrandRequestToJson(AddBrandRequest instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'sellerCarModels': instance.sellerCarModels,
    };

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      carModelId: json['carModelId'] as int?,
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'carModelId': instance.carModelId,
    };
