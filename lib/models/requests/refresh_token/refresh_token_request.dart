// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable()
class RefreshTokenRequest {
  String? langCode;

  String? accessToken;

  @JsonKey(name: 'RefreshToken')
  String? refreshToken;

  RefreshTokenRequest({
    this.langCode,
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
