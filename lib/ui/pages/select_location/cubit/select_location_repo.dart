import 'dart:convert';
import 'dart:developer';

import 'package:bid_express/models/responses/location_data/location_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SelectLocationRepo {
  Future<LocationData?> getSelectedLocationData(LatLng coordinates) async {
    LocationData _apiResponse = LocationData();
    try {
      final response = await http.get(Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=jsonv2&accept-language=ar&lat=${coordinates.latitude}&lon=${coordinates.longitude}'));

      log(response.request.toString() +
          '\n' +
          response.statusCode.toString() +
          '\n' +
          response.body);
      _apiResponse = LocationData.fromJson(json.decode(response.body));
      return _apiResponse;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
