// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      mobileNumber: json['MobileNumber'] as String?,
      mobileAreaCode: json['MobileAreaCode'] as String?,
      password: json['password'] as String?,
      langCode: json['langCode'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'langCode': instance.langCode,
      'MobileNumber': instance.mobileNumber,
      'MobileAreaCode': instance.mobileAreaCode,
      'password': instance.password,
    };
