import 'package:json_annotation/json_annotation.dart';

part 'car_model_response.g.dart';

@JsonSerializable()
class CarModelResponse {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? imageUrl;

  CarModelResponse({
    this.id,
    this.name,
    this.nameEn,
    this.imageUrl,
  });

  factory CarModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CarModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelResponseToJson(this);
}
