// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'verify_user_request.g.dart';

@JsonSerializable()
class VerifyUserRequest {
  @JsonKey(name: 'otp')
  final String? otp;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'client_id')
  String? clientId;

  @JsonKey(name: 'client_secret')
  String? clientSecret;

  VerifyUserRequest(
      {this.otp, this.password, this.clientId, this.clientSecret});

  factory VerifyUserRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyUserRequestToJson(this);
}
