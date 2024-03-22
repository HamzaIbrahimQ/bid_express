import 'package:json_annotation/json_annotation.dart';

part 'get_orders_response.g.dart';

@JsonSerializable()
class GetOrdersResponse {
  final bool? isSuccess;
  final String? errorMessage;
  final int? statusCode;
  final String? errorObject;
  final int? currentPage;
  final int? totalPages;
  final int? pageSize;
  final int? totalCount;
  final List<Order?>? data;

  GetOrdersResponse(
      this.isSuccess,
      this.errorMessage,
      this.statusCode,
      this.errorObject,
      this.currentPage,
      this.totalPages,
      this.pageSize,
      this.totalCount,
      this.data);

  factory GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersResponseToJson(this);
}

@JsonSerializable()
class Order {
  final int? id;
  final String? status;
  final List<String?>? partsNameAr;
  final List<String?>? partsNameEn;
  final String? carBrandImageUrl;
  final String? carBrand;
  final String? carModel;
  final bool? isSellerSelected;
  final int? bidsCount;

  Order(
      this.id,
      this.status,
      this.partsNameAr,
      this.partsNameEn,
      this.carBrandImageUrl,
      this.carBrand,
      this.carModel,
      this.isSellerSelected,
      this.bidsCount);

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
