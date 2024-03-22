import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String? userName;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? mobileAreaCode;
  final String? accessToken;
  final String? refreshToken;
  final int? sellerId;

  SignupResponse({
    this.userName,
    this.name,
    this.email,
    this.mobileNumber,
    this.mobileAreaCode,
    this.accessToken,
    this.refreshToken,
    this.sellerId,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
