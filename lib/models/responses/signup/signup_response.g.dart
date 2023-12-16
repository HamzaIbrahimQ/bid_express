// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
