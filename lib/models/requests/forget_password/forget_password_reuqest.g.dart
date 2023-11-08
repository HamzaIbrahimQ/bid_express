// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_reuqest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordRequest _$ForgetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordRequest(
      userName: json['userName'] as String?,
      langCode: json['langCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      newPassword: json['newPassword'] as String?,
      otpCode: json['otpCode'] as String?,
    );

Map<String, dynamic> _$ForgetPasswordRequestToJson(
        ForgetPasswordRequest instance) =>
    <String, dynamic>{
      'langCode': instance.langCode,
      'userName': instance.userName,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
      'newPassword': instance.newPassword,
      'otpCode': instance.otpCode,
    };
