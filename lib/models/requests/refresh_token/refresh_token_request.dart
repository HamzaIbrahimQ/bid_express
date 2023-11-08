// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable()
class RefreshTokenRequest {
  @JsonKey(name: 'langCode')
  final String? langCode;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'accessToken')
   String? accessToken;

  @JsonKey(name: 'refreshToken')
   String? refreshToken;

  RefreshTokenRequest({
    this.userName,
    this.langCode,
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
