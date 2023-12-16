import 'package:json_annotation/json_annotation.dart';

part 'add_brands_request.g.dart';

@JsonSerializable()
class AddBrandsRequest {
  List<AddBrandRequest?>? sellerCreateBrand;

  AddBrandsRequest({this.sellerCreateBrand});

  factory AddBrandsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddBrandsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddBrandsRequestToJson(this);
}

@JsonSerializable()
class AddBrandRequest {
  int? brandId;
  List<BrandModel?>? sellerCarModels;

  AddBrandRequest({this.brandId, this.sellerCarModels});

  factory AddBrandRequest.fromJson(
          Map<String, dynamic> json) =>
      _$AddBrandRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddBrandRequestToJson(this);
}

@JsonSerializable()
class BrandModel {
  int? carModelId;

  BrandModel({this.carModelId});

  factory BrandModel.fromJson(
          Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BrandModelToJson(this);
}
