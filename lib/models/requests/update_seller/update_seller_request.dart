import 'package:bid_express/models/responses/user_address/user_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_seller_request.g.dart';

@JsonSerializable()
class UpdateSellerRequest {
  final String? langCode;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? mobileAreaCode;
  final List<UserAddress>? userAddresses;
  final String? otpCode;
  final String? profilePictureFileName;
  final String? profilePictureFileBase64;

  UpdateSellerRequest({
    this.langCode,
    this.name,
    this.email,
    this.mobileNumber,
    this.mobileAreaCode,
    this.userAddresses,
    this.otpCode,
    this.profilePictureFileName,
    this.profilePictureFileBase64,
  });

  factory UpdateSellerRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSellerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSellerRequestToJson(this);
}
