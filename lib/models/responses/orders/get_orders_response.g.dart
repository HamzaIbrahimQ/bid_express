// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrdersResponse _$GetOrdersResponseFromJson(Map<String, dynamic> json) =>
    GetOrdersResponse(
      json['isSuccess'] as bool?,
      json['errorMessage'] as String?,
      json['statusCode'] as int?,
      json['errorObject'] as String?,
      json['currentPage'] as int?,
      json['totalPages'] as int?,
      json['pageSize'] as int?,
      json['totalCount'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetOrdersResponseToJson(GetOrdersResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorMessage': instance.errorMessage,
      'statusCode': instance.statusCode,
      'errorObject': instance.errorObject,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'] as int?,
      json['status'] as String?,
      (json['partsNameAr'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['partsNameEn'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['carBrandImageUrl'] as String?,
      json['carBrand'] as String?,
      json['carModel'] as String?,
      json['isSellerSelected'] as bool?,
      json['bidsCount'] as int?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'partsNameAr': instance.partsNameAr,
      'partsNameEn': instance.partsNameEn,
      'carBrandImageUrl': instance.carBrandImageUrl,
      'carBrand': instance.carBrand,
      'carModel': instance.carModel,
      'isSellerSelected': instance.isSellerSelected,
      'bidsCount': instance.bidsCount,
    };
