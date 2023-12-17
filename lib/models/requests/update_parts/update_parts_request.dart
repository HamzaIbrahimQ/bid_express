import 'package:json_annotation/json_annotation.dart';

part 'update_parts_request.g.dart';

@JsonSerializable()
class UpdatePartsRequest {
  String? langCode;
  UpdatePartsRequestSellerCategory? sellerCategory;

  UpdatePartsRequest({this.langCode, this.sellerCategory});

  factory UpdatePartsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePartsRequestToJson(this);
}

@JsonSerializable()
class UpdatePartsRequestSellerCategory {
  int? sellerCategoryId;
  int? sellerCarModelId;
  int? categoryId;
  bool? isDeleted;
  bool? isModified;
  List<UpdatePartsRequestSellerCategoryParts?>? parts;

  UpdatePartsRequestSellerCategory({
    this.sellerCategoryId,
    this.sellerCarModelId,
    this.categoryId,
    this.isDeleted,
    this.isModified,
    this.parts,
  });

  factory UpdatePartsRequestSellerCategory.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePartsRequestSellerCategoryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdatePartsRequestSellerCategoryToJson(this);
}

@JsonSerializable()
class UpdatePartsRequestSellerCategoryParts {
  int? partId;
  int? sellerCategoryId;
  int? sellerPartId;
  bool? isDeleted;
  bool? isModified;
  List<UpdatePartsRequestSellerCategoryPartsPartAdditions?>? partAdditions;

  UpdatePartsRequestSellerCategoryParts({
    this.partId,
    this.sellerCategoryId,
    this.sellerPartId,
    this.isDeleted,
    this.isModified,
    this.partAdditions,
  });

  factory UpdatePartsRequestSellerCategoryParts.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePartsRequestSellerCategoryPartsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdatePartsRequestSellerCategoryPartsToJson(this);
}

@JsonSerializable()
class UpdatePartsRequestSellerCategoryPartsPartAdditions {
  int? partAdditionId;
  int? sellerPartId;
  bool? isDeleted;
  bool? isModified;
  int? sellerPartAdditionId;

  UpdatePartsRequestSellerCategoryPartsPartAdditions({
    this.partAdditionId,
    this.sellerPartId,
    this.isDeleted,
    this.isModified,
    this.sellerPartAdditionId,
  });

  factory UpdatePartsRequestSellerCategoryPartsPartAdditions.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePartsRequestSellerCategoryPartsPartAdditionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdatePartsRequestSellerCategoryPartsPartAdditionsToJson(this);
}
