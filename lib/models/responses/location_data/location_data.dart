// Package imports:
import 'package:bid_express/models/responses/location_data/address_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_data.g.dart';

@JsonSerializable()
class LocationData {

  @JsonKey(name: 'place_id')
  final int? placeId;

  @JsonKey(name: 'lat')
  final String? lat;

  @JsonKey(name: 'lon')
  final String? long;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'display_name')
  final String? displayName;

  @JsonKey(name: 'address')
  final AddressData? addressData;



  LocationData({
    this.placeId,
    this.lat,
    this.long,
    this.name,
    this.displayName,
    this.addressData,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
