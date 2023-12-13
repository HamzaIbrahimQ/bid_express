import 'package:bid_express/models/responses/user_address/user_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserData {
  final int? id;
  final String? name;
  final String? userName;
  final String? email;
  final String? profilePicture;
  final String? mobileNumber;
  final String? mobileAreaCode;
  final String? role;
  final List<UserAddress?>? userAddresses;

  UserData({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.profilePicture,
    this.mobileNumber,
    this.mobileAreaCode,
    this.role,
    this.userAddresses,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

