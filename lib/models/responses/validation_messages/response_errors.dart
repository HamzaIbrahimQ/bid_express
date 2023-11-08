// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'response_errors.g.dart';

@JsonSerializable()
class ResponseError {
  @JsonKey(name: 'mobileAreaCode')
  List<String>? mobileAreaCode;

  @JsonKey(name: 'mobileNumber')
  List<String>? mobileNumber;

  ResponseError({
    this.mobileAreaCode,
    this.mobileNumber,
  });

  factory ResponseError.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);
}
