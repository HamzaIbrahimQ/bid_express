// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserRequest _$VerifyUserRequestFromJson(Map<String, dynamic> json) =>
    VerifyUserRequest(
      otp: json['otp'] as String?,
      password: json['password'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$VerifyUserRequestToJson(VerifyUserRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'password': instance.password,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
