import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? imageUrl;
  bool? isSelected;

  CategoryResponse({
    this.id,
    this.name,
    this.nameEn,
    this.imageUrl,
    this.isSelected,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
