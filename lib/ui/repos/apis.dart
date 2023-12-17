import 'dart:convert';
import 'package:bid_express/models/requests/logout/logout_request.dart';
import 'package:bid_express/models/requests/update_seller/update_seller_request.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/part/part_response.dart';
import 'package:bid_express/models/responses/part_addition/part_addition_response.dart';
import 'package:bid_express/models/responses/update_seller/update_seller_response.dart';
import 'package:bid_express/models/responses/user/user_data_model.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class APIs extends BaseRepository {


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



  Future<MainResponse?> logout({required LogoutRequest logoutRequest}) async {
    MainResponse _apiResponse = MainResponse();
    final String _token = await getAccessToken();
    final _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };

    try {
      final response = await http.post(
        Uri.parse('${baseUrl}User/Logout'),
        headers: _headers,
        body: logoutRequest.toJson(),
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

  Future<UpdateSellerResponse?> updateSeller(
      {required UpdateSellerRequest updateSellerRequest,
      required int sellerId}) async {
    UpdateSellerResponse _apiResponse = UpdateSellerResponse();
    final String _token = await getAccessToken();
    final _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };

    try {
      final response = await http.put(
        Uri.parse('${baseUrl}Seller/UpdateSeller/Id?Id=$sellerId'),
        headers: _headers,
        body: updateSellerRequest.toJson(),
      );

      log(response.request.toString() +
          '\n' +
          response.statusCode.toString() +
          '\n' +
          response.body);
      _apiResponse = UpdateSellerResponse.fromJson(json.decode(response.body));
      return _apiResponse;
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }
}
