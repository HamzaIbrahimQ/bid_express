// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      password: json['password'] as String?,
      city: json['city'] as String?,
      area: json['area'] as String?,
      street: json['street'] as String?,
      langCode: json['langCode'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      otpCode: json['otpCode'] as String?,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'name': instance.name,
      'email': instance.email,
      'langCode': instance.langCode,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
      'password': instance.password,
      'city': instance.city,
      'area': instance.area,
      'street': instance.street,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'otpCode': instance.otpCode,
    };
