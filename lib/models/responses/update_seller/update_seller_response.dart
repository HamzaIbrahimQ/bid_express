import 'package:json_annotation/json_annotation.dart';

part 'update_seller_response.g.dart';

@JsonSerializable()
class UpdateSellerResponse {
  final bool? isSuccess;
  final String? errorMessage;
  final String? userName;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? mobileAreaCode;

  UpdateSellerResponse({
    this.isSuccess,
    this.errorMessage,
    this.userName,
    this.name,
    this.email,
    this.mobileNumber,
    this.mobileAreaCode,
  });

  factory UpdateSellerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSellerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSellerResponseToJson(this);
}
