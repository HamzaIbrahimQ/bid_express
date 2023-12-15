import 'package:json_annotation/json_annotation.dart';
import 'package:json_reflectable/json_reflectable.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  String? langCode;
  String? userName;
  String? name;
  String? email;
  String? mobileNumber;
  String? mobileAreaCode;
  String? password;
  String? addressName;
  String? city;
  String? area;
  String? street;
  double? longitude;
  double? latitude;
  String? otpCode;
  String? profilePictureFileName;
  String? profilePictureFileBase64;

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
