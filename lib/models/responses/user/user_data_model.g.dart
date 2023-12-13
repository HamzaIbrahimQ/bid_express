// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileAreaCode: json['mobileAreaCode'] as String?,
      role: json['role'] as String?,
      userAddresses: (json['userAddresses'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userName': instance.userName,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'mobileNumber': instance.mobileNumber,
      'mobileAreaCode': instance.mobileAreaCode,
      'role': instance.role,
      'userAddresses': instance.userAddresses,
    };
