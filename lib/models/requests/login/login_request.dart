// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'langCode')
  String? langCode;

  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'password')
  String? password;

  LoginRequest({this.userName, this.password, this.langCode});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
