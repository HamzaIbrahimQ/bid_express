import 'package:json_annotation/json_annotation.dart';

part 'part_addition_response.g.dart';

@JsonSerializable()
class PartAdditionResponse {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? imageUrl;

  PartAdditionResponse({
    this.id,
    this.name,
    this.nameEn,
    this.imageUrl,
  });

  factory PartAdditionResponse.fromJson(Map<String, dynamic> json) =>
      _$PartAdditionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PartAdditionResponseToJson(this);
}
