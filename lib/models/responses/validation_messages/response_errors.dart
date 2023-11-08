// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'response_errors.g.dart';

@JsonSerializable()
class ResponseErrors {
  @JsonKey(name: 'mobileAreaCode')
  List<String>? mobileAreaCode;

  @JsonKey(name: 'mobileNumber')
  List<String>? mobileNumber;

  ResponseErrors({
    this.mobileAreaCode,
    this.mobileNumber,
  });

  factory ResponseErrors.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseErrorsToJson(this);
}
