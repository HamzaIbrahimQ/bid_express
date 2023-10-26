// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'address_data.g.dart';

@JsonSerializable()
class AddressData {
  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'neighbourhood')
  final String? neighbourhood;

  @JsonKey(name: 'state_district')
  final String? stateDistrict;

  @JsonKey(name: 'suburb')
  final String? suburb;

  @JsonKey(name: 'road')
  final String? road;

  AddressData({
    this.country,
    this.countryCode,
    this.city,
    this.state,
    this.neighbourhood,
    this.stateDistrict,
    this.suburb,
    this.road,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
