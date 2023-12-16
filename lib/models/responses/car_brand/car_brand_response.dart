import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_brand_response.g.dart';

@JsonSerializable()
class CarBrandResponse {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? imageUrl;
  bool? isSelected;
  List<CarModelResponse>? models;
  List<CarModelResponse>? myModels;
  List<CarModelResponse>? searchList;
  List<CarModelResponse>? myModelsSearchList;

  CarBrandResponse({
    this.id,
    this.name,
    this.nameEn,
    this.imageUrl,
    this.isSelected,
    this.models,
    this.myModels,
    this.searchList,
    this.myModelsSearchList,
  });

  factory CarBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$CarBrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CarBrandResponseToJson(this);
}
