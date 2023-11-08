// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      isSuccess: json['isSuccess'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      userName: json['userName'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorMessage': instance.errorMessage,
      'userName': instance.userName,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'mobileAreaCode': instance.mobileAreaCode,
    };
