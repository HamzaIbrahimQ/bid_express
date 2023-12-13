import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final bool? isSuccess;
  final String? errorMessage;
  final String? userName;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? mobileAreaCode;

  SignupResponse({
    this.isSuccess,
    this.errorMessage,
    this.userName,
    this.name,
    this.email,
    this.mobileNumber,
    this.mobileAreaCode,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
