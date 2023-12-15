import 'package:json_annotation/json_annotation.dart';

part 'user_address_model.g.dart';

@JsonSerializable()
class UserAddress {
  final int? id;
  final String? addressName;
  final String? city;
  final String? area;
  final String? street;
  final double? longitude;
  final double? latitude;

  UserAddress({
    this.id,
    this.addressName,
    this.city,
    this.area,
    this.street,
    this.longitude,
    this.latitude,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}
