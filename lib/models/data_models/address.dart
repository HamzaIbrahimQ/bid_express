import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: 'ID')
  final String? id;

  @JsonKey(name: 'COORDINATES')
  final String? coordinates;

  @JsonKey(name: 'ADDRESS_NAME')
  final String? name;

  @JsonKey(name: 'CITY')
  final String? city;

  @JsonKey(name: 'AREA')
  final String? area;

  @JsonKey(name: 'STREET')
  final String? street;

  @JsonKey(name: 'BUILDING')
  final String? building;

  Address({
    this.id,
    this.coordinates,
    this.name,
    this.city,
    this.area,
    this.street,
    this.building,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
