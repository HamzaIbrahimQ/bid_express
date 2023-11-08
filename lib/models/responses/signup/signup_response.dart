import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @JsonKey(name: 'errorMessage')
  final String? errorMessage;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'mobileNumber')
  final String? mobileNumber;

  @JsonKey(name: 'mobileAreaCode')
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
