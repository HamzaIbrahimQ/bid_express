// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  String? oldPassword;

  String? newPassword;

  String? otpCode;

  ChangePasswordRequest({
    this.oldPassword,
    this.newPassword,
    this.otpCode,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
