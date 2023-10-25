// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      userName: json['user_name'] as String?,
      password: json['password'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
      fcmToken: json['fcm_token'] as String?,
      deviceId: json['device_id'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'password': instance.password,
      'fcm_token': instance.fcmToken,
      'device_id': instance.deviceId,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
