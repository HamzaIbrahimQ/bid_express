// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseError _$ResponseErrorFromJson(Map<String, dynamic> json) =>
    ResponseError(
      mobileAreaCode: (json['mobileAreaCode'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mobileNumber: (json['mobileNumber'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ResponseErrorToJson(ResponseError instance) =>
    <String, dynamic>{
      'mobileAreaCode': instance.mobileAreaCode,
      'mobileNumber': instance.mobileNumber,
    };
