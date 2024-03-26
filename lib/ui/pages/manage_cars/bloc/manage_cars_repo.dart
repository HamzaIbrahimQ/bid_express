import 'dart:convert';
import 'package:bid_express/models/requests/add_brands/add_brands_request.dart';
import 'package:bid_express/models/requests/add_categories/add_categories_request.dart';
import 'package:bid_express/models/responses/category/category_response.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/refresh_token/refresh_token_response.dart';
import 'package:bid_express/models/responses/selected_category/selected_category.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class ManageCarsRepository extends BaseRepository {
  Future<MainResponse<List<GetCarsResponse>>?> getCars() async {
    MainResponse<List<GetCarsResponse>> _apiResponse =
        MainResponse<List<GetCarsResponse>>();

    final String _token = await getAccessToken();
    String? _refreshedToken;
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_refreshedToken ?? _token}',
    };

    try {
      final response = await http.get(
        Uri.parse('${baseUrl}Seller/GetSellerCarConfiguration?langCode=en'),
        headers: _headers,
      );
      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
            await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return getCars();
      } else {
        log(response.request.toString() +
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

  Future<MainResponse<List<CategoryResponse>>?> getCategories() async {
    MainResponse<List<CategoryResponse>> _apiResponse =
        MainResponse<List<CategoryResponse>>();
    final String _token = await getAccessToken();
    String? _refreshedToken;
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_refreshedToken ?? _token}',
    };
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}Category/GetCategories'),
        headers: _headers,
      );
      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
            await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return getCategories();
      } else {
        log(response.request.toString() +
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

  Future<MainResponse<List<SelectedCategory>>?> getSelectedCategories(
      {required int modelId}) async {
    MainResponse<List<SelectedCategory>> _apiResponse =
        MainResponse<List<SelectedCategory>>();
    final String _token = await getAccessToken();
    String? _refreshedToken;
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_refreshedToken ?? _token}',
    };
    try {
      final response = await http.get(
        Uri.parse(
            '${baseUrl}Seller/GetSellerPartConfiguration?sellerCarModleId=$modelId&langCode=en'),
        headers: _headers,
      );
      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
            await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return getSelectedCategories(modelId: modelId);
      } else {
        log(response.request.toString() +
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



  Future<MainResponse?> addCategories(
      {required AddCategoriesRequest request}) async {
    MainResponse _apiResponse = MainResponse();
    final String _token = await getAccessToken();
    String? _refreshedToken;
    final _headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_refreshedToken ?? _token}',
    };

    try {
        // request.sellerId = await getSellerId();
      final response = await http.post(
        Uri.parse('${baseUrl}Seller/AddSellerPartsConfiguration'),
        headers: _headers,
        body: json.encode(request.toJson()),
      );
      log(response.request.toString() +
          '\n' +
          json.encode(request.toJson()) +
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
