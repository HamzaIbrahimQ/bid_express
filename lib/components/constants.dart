import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

final NumberFormat amountFormat = NumberFormat('###,###', 'en_US');

/// mobile regex
final RegExp mobileRegex = RegExp(r'^07[0-9]{8}$');

/// password regex
final RegExp passwordRegex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@.#\$&*~])\S{8,}$');

/// business name regex
final RegExp businessNameRegex =
    RegExp(r'^[a-zA-Z\u0600-\u06FF][a-zA-Z0-9\u0600-\u06FF]*$');

/// street and building name regex
final RegExp streetAndBuildingRegex = RegExp(r'^[a-zA-Z0-9\u0600-\u06FF]+$');


final LatLngBounds jordanBounds = LatLngBounds(
  southwest: const LatLng(29.0000, 34.0000),
  northeast: const LatLng(33.5000, 39.3000),
);


/// Jordan borders polygons
final Set<Polygon> polygons = {
  Polygon(
    polygonId: const PolygonId('jordan_border'),
    points: _createJordanBorder(),
    strokeWidth: 2,
    strokeColor: Colors.red,
    fillColor: Colors.transparent,
  ),
};

List<LatLng> _createJordanBorder() {
  return const [
    LatLng(32.333126, 36.821604),
    LatLng(33.366201, 38.797546),
    LatLng(32.499426, 39.078118),
    LatLng(32.464176, 38.988574),
    LatLng(32.302857, 39.036331),
    LatLng(32.343213, 39.257206),
    LatLng(32.222089, 39.304963),
    LatLng(31.999608, 39.006482),
    LatLng(31.491961, 37.006662),
    LatLng(30.494197, 37.991376),
    LatLng(30.330380, 37.661564),
    LatLng(29.993747, 37.500881),
    LatLng(29.859845, 36.753085),
    LatLng(29.489343, 36.512060),
    LatLng(29.193041, 36.079451),
    LatLng(29.354767, 34.960847),
    LatLng(32.636020, 35.562675),
    LatLng(32.645335, 35.612458),
    LatLng(32.668620, 35.601395),
    LatLng(32.682588, 35.673303),
    LatLng(32.707091, 35.678889),
    LatLng(32.744189, 35.805671),
    LatLng(32.651415, 36.037184),
    LatLng(32.512073, 36.075770),
    LatLng(32.516721, 36.197039),
    LatLng(32.377170, 36.384455),
    LatLng(32.302654, 36.841970),
  ];
}
