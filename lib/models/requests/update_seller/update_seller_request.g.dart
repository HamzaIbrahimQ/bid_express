// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_seller_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSellerRequest _$UpdateSellerRequestFromJson(Map<String, dynamic> json) =>
    UpdateSellerRequest(
      langCode: json['langCode'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      userAddresses: (json['userAddresses'] as List<dynamic>?)
          ?.map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      otpCode: json['otpCode'] as String?,
      profilePictureFileName: json['profilePictureFileName'] as String?,
      profilePictureFileBase64: json['profilePictureFileBase64'] as String?,
    );

Map<String, dynamic> _$UpdateSellerRequestToJson(
        UpdateSellerRequest instance) =>
    <String, dynamic>{
      'langCode': instance.langCode,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
      'userAddresses': instance.userAddresses,
      'otpCode': instance.otpCode,
      'profilePictureFileName': instance.profilePictureFileName,
      'profilePictureFileBase64': instance.profilePictureFileBase64,
    };
