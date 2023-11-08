import 'package:json_annotation/json_annotation.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @JsonKey(name: 'errorMessage')
  final String? errorMessage;

  ChangePasswordResponse({this.isSuccess, this.errorMessage});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
