import 'dart:convert';

import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/part/part_response.dart';
import 'package:bid_express/models/responses/part_addition/part_addition_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class ManagePartsRepository extends BaseRepository {


  Future<MainResponse<List<PartResponse>>?> getParts(
      {required int categoryId}) async {
    MainResponse<List<PartResponse>> _apiResponse =
    MainResponse<List<PartResponse>>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}Part/GetParts?categoryId=$categoryId'),
        headers: _headers,
      );

      log(response.request.toString() +
          '\n' +
          response.statusCode.toString() +
          '\n' +
          response.body);
      _apiResponse = MainResponse.fromJson(json.decode(response.body));
      return _apiResponse;
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }


  Future<MainResponse<List<PartAdditionResponse>>?> getPartAdditions(
      {required int partId}) async {
    MainResponse<List<PartAdditionResponse>> _apiResponse =
    MainResponse<List<PartAdditionResponse>>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}PartAdditions/GetPartAdditions?partId=$partId'),
        headers: _headers,
      );

      log(response.request.toString() +
          '\n' +
          response.statusCode.toString() +
          '\n' +
          response.body);
      _apiResponse = MainResponse.fromJson(json.decode(response.body));
      return _apiResponse;
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }

}
