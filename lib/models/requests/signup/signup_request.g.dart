// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationInfo _$RegistrationInfoFromJson(Map<String, dynamic> json) =>
    RegistrationInfo(
      userName: json['user_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      countryId: json['country_id'] as String?,
      countryCodeId: json['country_code_id'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirm_password'] as String?,
      profileImage: json['profile_image'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$RegistrationInfoToJson(RegistrationInfo instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'user_name': instance.userName,
      'country_id': instance.countryId,
      'country_code_id': instance.countryCodeId,
      'mobile_number': instance.mobileNumber,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'profile_image': instance.profileImage,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
