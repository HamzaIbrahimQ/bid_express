
import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request.g.dart';

@JsonSerializable()
class ResendOtpRequest {
  @JsonKey(name: 'mobile_number')
  String? mobileNumber;

  @JsonKey(name: 'client_id')
  String? clientId;

  @JsonKey(name: 'client_secret')
  String? clientSecret;


  ResendOtpRequest({
    this.mobileNumber,
    this.clientId,
    this.clientSecret,
  });

  factory ResendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestFromJson(json);

  Map<String, String> toJson() => resendOtpRequestToJson(this);

  Map<String, String> resendOtpRequestToJson(ResendOtpRequest instance) =>
      <String, String>{
        'mobile_number': instance.mobileNumber ?? '',
        'client_id': instance.clientId ?? '',
        'client_secret': instance.clientSecret ?? '',
      };
}
