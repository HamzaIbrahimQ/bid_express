// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_seller_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSellerResponse _$UpdateSellerResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateSellerResponse(
      isSuccess: json['isSuccess'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
    );

Map<String, dynamic> _$UpdateSellerResponseToJson(
        UpdateSellerResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorMessage': instance.errorMessage,
      'userName': instance.userName,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
    };
