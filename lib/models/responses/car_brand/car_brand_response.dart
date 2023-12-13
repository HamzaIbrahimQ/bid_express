import 'package:json_annotation/json_annotation.dart';

part 'car_brand_response.g.dart';

@JsonSerializable()
class CarBrandResponse {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? imageUrl;

  CarBrandResponse({
    this.id,
    this.name,
    this.nameEn,
    this.imageUrl,
  });

  factory CarBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$CarBrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CarBrandResponseToJson(this);
}
