// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpRequest _$ResendOtpRequestFromJson(Map<String, dynamic> json) =>
    ResendOtpRequest(
      mobileNumber: json['mobile_number'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$ResendOtpRequestToJson(ResendOtpRequest instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobileNumber,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
