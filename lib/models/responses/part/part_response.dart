import 'package:json_annotation/json_annotation.dart';

part 'part_response.g.dart';

@JsonSerializable()
class PartResponse {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? imageUrl;

  PartResponse({
    this.id,
    this.name,
    this.nameEn,
    this.imageUrl,
  });

  factory PartResponse.fromJson(Map<String, dynamic> json) =>
      _$PartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PartResponseToJson(this);
}
