import 'dart:convert';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/part/part_response.dart';
import 'package:bid_express/models/responses/part_addition/part_addition_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class APIs extends BaseRepository {
  Future<MainResponse<List<CarBrandResponse>>?> getBrands() async {
    MainResponse<List<CarBrandResponse>> _apiResponse =
        MainResponse<List<CarBrandResponse>>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http
          .get(Uri.parse('${baseUrl}CarBrand/GetCarBrands'), headers: _headers);

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

  Future<MainResponse<List<CarModelResponse>>?> getModels(
      {required int brandId}) async {
    MainResponse<List<CarModelResponse>> _apiResponse =
        MainResponse<List<CarModelResponse>>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}CarModel/GetCarModels?brandId=$brandId'),
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

  Future<MainResponse<List<Category>>?> getCategories() async {
    MainResponse<List<Category>> _apiResponse = MainResponse<List<Category>>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}Category/GetCategories'),
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
