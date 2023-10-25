// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'fcm_token')
  String? fcmToken;

  @JsonKey(name: 'device_id')
  String? deviceId;

  @JsonKey(name: 'client_id')
  String? clientId;

  @JsonKey(name: 'client_secret')
  String? clientSecret;


  LoginRequest({
    this.userName,
    this.password,
    this.clientId,
    this.clientSecret,
    this.fcmToken,
    this.deviceId
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
