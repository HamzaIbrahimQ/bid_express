// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseErrors _$ResponseErrorsFromJson(Map<String, dynamic> json) =>
    ResponseErrors(
      mobileAreaCode: (json['mobileAreaCode'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mobileNumber: (json['mobileNumber'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ResponseErrorsToJson(ResponseErrors instance) =>
    <String, dynamic>{
      'mobileAreaCode': instance.mobileAreaCode,
      'mobileNumber': instance.mobileNumber,
    };
