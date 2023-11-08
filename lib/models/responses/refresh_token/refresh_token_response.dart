// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse {
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @JsonKey(name: 'errorMessage')
  final String? errorMessage;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  RefreshTokenResponse({
    this.isSuccess,
    this.userName,
    this.errorMessage,
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
