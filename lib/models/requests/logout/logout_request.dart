// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'logout_request.g.dart';

@JsonSerializable()
class LogoutRequest {
  @JsonKey(name: 'langCode')
  String? langCode;

  @JsonKey(name: 'userName')
  String? userName;

  LogoutRequest({this.userName, this.langCode});

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);
}
