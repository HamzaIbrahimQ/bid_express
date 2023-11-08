import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
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

  @JsonKey(name: 'mobileAreaCode')
  final String? mobileAreaCode;

  LoginResponse({
    this.isSuccess,
    this.errorMessage,
    this.userName,
    this.mobileAreaCode,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
