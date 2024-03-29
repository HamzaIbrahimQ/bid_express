import 'dart:convert';

import 'package:bid_express/models/requests/add_brands/add_brands_request.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/refresh_token/refresh_token_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class GetBrandsRepository extends BaseRepository {
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
      if (response.body.isNotEmpty) {
        _apiResponse = MainResponse.fromJson(json.decode(response.body));
      }

      return _apiResponse;
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }

  Future<MainResponse?> addBrands(
      {required AddBrandsRequest addBrandsRequest}) async {
    MainResponse _apiResponse = MainResponse();

    final String _token = await getAccessToken();
    String? _refreshedToken;
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_refreshedToken ?? _token}',
      'langCode': 'en',
    };

    try {
      final response = await http.post(
        Uri.parse('${baseUrl}Seller/AddSellerCarConfiguration'),
        headers: _headers,
        body: json.encode(addBrandsRequest.toJson()),
      );
      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
            await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return addBrands(addBrandsRequest: addBrandsRequest);
      } else {
        log(json.encode(addBrandsRequest.toJson()) + '\n'+  response.request.toString() +
            '\n' +
            response.statusCode.toString() +
            '\n' +
            response.body);
        _apiResponse = MainResponse.fromJson(json.decode(response.body));
        return _apiResponse;
      }
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }
}
