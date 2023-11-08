// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;

  @JsonKey(name: 'mobileAreaCode')
  String? mobileAreaCode;

  @JsonKey(name: 'oldPassword')
  String? oldPassword;

  @JsonKey(name: 'newPassword')
  String? newPassword;

  @JsonKey(name: 'otpCode')
  String? otpCode;

  ChangePasswordRequest({
    this.userName,
    this.mobileNumber,
    this.mobileAreaCode,
    this.oldPassword,
    this.newPassword,
    this.otpCode,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
