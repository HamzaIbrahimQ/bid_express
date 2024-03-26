import 'package:json_annotation/json_annotation.dart';

part 'add_categories_request.g.dart';

@JsonSerializable()
class AddCategoriesRequest {
  int? sellerId;
  int? tempSellerId;
  String? langCode;
  List<AddCategoriesRequestSellerCategories?>? sellerCategories;

  AddCategoriesRequest({
    this.sellerId = 0,
    this.tempSellerId = 0,
    this.langCode = 'en',
    this.sellerCategories,
  });

  factory AddCategoriesRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCategoriesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddCategoriesRequestToJson(this);
}

@JsonSerializable()
class AddCategoriesRequestSellerCategories {
  final int? categoryId;
  final int? sellerCarModelId;
  final int? fromYear;
  final int? toYear;
  final List<AddCategoriesRequestSellerCategoriesParts?>? parts;

  AddCategoriesRequestSellerCategories({
    this.categoryId,
    this.sellerCarModelId,
    this.fromYear,
    this.toYear,
    this.parts = const [],
  });

  factory AddCategoriesRequestSellerCategories.fromJson(
          Map<String, dynamic> json) =>
      _$AddCategoriesRequestSellerCategoriesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddCategoriesRequestSellerCategoriesToJson(this);
}

@JsonSerializable()
class AddCategoriesRequestSellerCategoriesParts {
  final int? partId;
  final List<AddCategoriesRequestSellerCategoriesPartsPartAdditions?>?
      partAdditions;

  AddCategoriesRequestSellerCategoriesParts({
    this.partId,
    this.partAdditions,
  });

  factory AddCategoriesRequestSellerCategoriesParts.fromJson(
          Map<String, dynamic> json) =>
      _$AddCategoriesRequestSellerCategoriesPartsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddCategoriesRequestSellerCategoriesPartsToJson(this);
}

@JsonSerializable()
class AddCategoriesRequestSellerCategoriesPartsPartAdditions {
  final int? partAdditionId;

  AddCategoriesRequestSellerCategoriesPartsPartAdditions({this.partAdditionId});

  factory AddCategoriesRequestSellerCategoriesPartsPartAdditions.fromJson(
          Map<String, dynamic> json) =>
      _$AddCategoriesRequestSellerCategoriesPartsPartAdditionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddCategoriesRequestSellerCategoriesPartsPartAdditionsToJson(this);
}
