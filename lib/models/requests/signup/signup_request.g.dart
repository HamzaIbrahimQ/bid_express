// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      langCode: json['langCode'] as String?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      password: json['password'] as String?,
      addressName: json['addressName'] as String?,
      city: json['city'] as String?,
      area: json['area'] as String?,
      street: json['street'] as String?,
      longitude: json['longitude'] as int?,
      latitude: json['latitude'] as int?,
      otpCode: json['otpCode'] as String?,
      profilePictureFileName: json['profilePictureFileName'] as String?,
      profilePictureFileBase64: json['profilePictureFileBase64'] as String?,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'langCode': instance.langCode,
      'userName': instance.userName,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
      'password': instance.password,
      'addressName': instance.addressName,
      'city': instance.city,
      'area': instance.area,
      'street': instance.street,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'otpCode': instance.otpCode,
      'profilePictureFileName': instance.profilePictureFileName,
      'profilePictureFileBase64': instance.profilePictureFileBase64,
    };
