// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse(
      isSuccess: json['isSuccess'] as bool?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorMessage': instance.errorMessage,
    };
