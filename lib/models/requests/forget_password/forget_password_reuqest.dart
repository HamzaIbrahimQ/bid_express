// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_reuqest.g.dart';

@JsonSerializable()
class ForgetPasswordRequest {
  @JsonKey(name: 'langCode')
  String? langCode;

  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;

  @JsonKey(name: 'mobileAreaCode')
  String? mobileAreaCode;

  @JsonKey(name: 'newPassword')
  String? newPassword;

  @JsonKey(name: 'otpCode')
  String? otpCode;

  ForgetPasswordRequest({
    this.userName,
    this.langCode,
    this.mobileNumber,
    this.mobileAreaCode,
    this.newPassword,
    this.otpCode,
  });

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
