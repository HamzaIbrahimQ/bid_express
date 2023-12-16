import 'package:json_annotation/json_annotation.dart';

part 'selected_category.g.dart';

@JsonSerializable()
class SelectedCategory {
  final int? sellerCarModelId;
  final int? sellerCategoryId;
  final int? categoryId;
  final String? name;
  final String? imageUrl;
  final List<SelectedCategoryPart?>? parts;
  final List<int?>? partIdList;

  SelectedCategory(this.sellerCarModelId, this.sellerCategoryId,
      this.categoryId, this.name, this.imageUrl, this.parts, this.partIdList);

  factory SelectedCategory.fromJson(Map<String, dynamic> json) =>
      _$SelectedCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedCategoryToJson(this);
}

@JsonSerializable()
class SelectedCategoryPart {
  final int? partId;
  final int? sellerCategoryId;
  final int? sellerPartId;
  final String? name;
  final String? imageUrl;
  final List<SelectedCategoryPartAdditions?>? partAdditions;
  final List<int?>? partAdditionIdList;

  SelectedCategoryPart(this.partId, this.sellerCategoryId, this.sellerPartId,
      this.name, this.imageUrl, this.partAdditions, this.partAdditionIdList);

  factory SelectedCategoryPart.fromJson(Map<String, dynamic> json) =>
      _$SelectedCategoryPartFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedCategoryPartToJson(this);
}

@JsonSerializable()
class SelectedCategoryPartAdditions {
  final int? partAdditionId;
  final int? sellerPartId;
  final int? sellerPartAdditionId;
  final String? name;
  final String? imageUrl;

  SelectedCategoryPartAdditions(this.partAdditionId, this.sellerPartId,
      this.sellerPartAdditionId, this.name, this.imageUrl);

  factory SelectedCategoryPartAdditions.fromJson(
          Map<String, dynamic> json) =>
      _$SelectedCategoryPartAdditionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SelectedCategoryPartAdditionsToJson(this);
}
