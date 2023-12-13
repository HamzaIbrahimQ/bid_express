import 'package:json_annotation/json_annotation.dart';
import 'package:json_reflectable/json_reflectable.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  final String? langCode;
  final String? userName;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? mobileAreaCode;
  final String? password;
  final String? addressName;
  final String? city;
  final String? area;
  final String? street;
  final int? longitude;
  final int? latitude;
  final String? otpCode;
  final String? profilePictureFileName;
  final String? profilePictureFileBase64;

  SignupRequest({
    this.langCode,
    this.userName,
    this.name,
    this.email,
    this.mobileNumber,
    this.mobileAreaCode,
    this.password,
    this.addressName,
    this.city,
    this.area,
    this.street,
    this.longitude,
    this.latitude,
    this.otpCode,
    this.profilePictureFileName,
    this.profilePictureFileBase64,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
