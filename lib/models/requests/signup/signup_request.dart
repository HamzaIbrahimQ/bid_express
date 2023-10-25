// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class RegistrationInfo {
  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'country_id')
  String? countryId;

  @JsonKey(name: 'country_code_id')
  String? countryCodeId;

  @JsonKey(name: 'mobile_number')
  String? mobileNumber;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'confirm_password')
  String? confirmPassword;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  @JsonKey(name: 'client_id')
  String? clientId;

  @JsonKey(name: 'client_secret')
  String? clientSecret;

  RegistrationInfo({
    this.userName,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.countryId,
    this.countryCodeId,
    this.password,
    this.confirmPassword,
    this.profileImage,
    this.clientId,
    this.clientSecret,
  });

  factory RegistrationInfo.fromJson(Map<String, dynamic> json) =>
      _$RegistrationInfoFromJson(json);

  Map<String, String> toJson() => _registrationInfoToJson(this);

  Map<String, String> _registrationInfoToJson(RegistrationInfo instance) =>
      <String, String>{
        'user_name': instance.userName ?? '',
        'first_name': instance.firstName ?? '',
        'last_name': instance.lastName ?? '',
        'mobile_number': instance.mobileNumber ?? '',
        'country_id': instance.countryId ?? '',
        'country_code_id': instance.countryCodeId ?? '',
        'password': instance.password ?? '',
        'confirm_password': instance.confirmPassword ?? '',
        'client_id': instance.clientId ?? '',
        'client_secret': instance.clientSecret ?? '',
      };
}
