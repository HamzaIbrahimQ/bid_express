import 'package:json_annotation/json_annotation.dart';

part 'get_cars_response.g.dart';

@JsonSerializable()
class GetCarsResponse {
  final int? sellerBrandId;
  final int? brandId;
  final String? name;
  final String? imageUrl;
  final List<GetCarsResponseCarModels?>? sellerCarModels;
  final List<int?>? carModelIdList;

  GetCarsResponse(this.sellerBrandId, this.brandId, this.name, this.imageUrl,
      this.sellerCarModels, this.carModelIdList);

  factory GetCarsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCarsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCarsResponseToJson(this);
}

@JsonSerializable()
class GetCarsResponseCarModels {
  final int? sellerBrandId;
  final int? sellerCarModelId;
  final int? carModelId;
  final String? name;
  final String? imageUrl;

  GetCarsResponseCarModels(this.sellerBrandId, this.sellerCarModelId,
      this.carModelId, this.name, this.imageUrl);

  factory GetCarsResponseCarModels.fromJson(Map<String, dynamic> json) =>
      _$GetCarsResponseCarModelsFromJson(json);

  Map<String, dynamic> toJson() => _$GetCarsResponseCarModelsToJson(this);
}
