import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'langCode')
  String? langCode;

  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;

  @JsonKey(name: 'mobileAreaCode')
  String? mobileAreaCode;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'area')
  String? area;

  @JsonKey(name: 'street')
  String? street;

  @JsonKey(name: 'latitude')
  double? latitude;

  @JsonKey(name: 'longitude')
  double? longitude;

  @JsonKey(name: 'otpCode')
  String? otpCode;

  SignupRequest({
    this.userName,
    this.name,
    this.email,
    this.mobileNumber,
    this.mobileAreaCode,
    this.password,
    this.city,
    this.area,
    this.street,
    this.langCode,
    this.latitude,
    this.longitude,
    this.otpCode,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);

// Map<String, String> _SignupRequestToJson(SignupRequest instance) =>
//     <String, String>{
//       'user_name': instance.userName ?? '',
//       'first_name': instance.firstName ?? '',
//       'last_name': instance.lastName ?? '',
//       'mobile_number': instance.mobileNumber ?? '',
//       'country_id': instance.countryId ?? '',
//       'country_code_id': instance.countryCodeId ?? '',
//       'password': instance.password ?? '',
//       'confirm_password': instance.confirmPassword ?? '',
//       'client_id': instance.clientId ?? '',
//       'client_secret': instance.clientSecret ?? '',
//     };
}
