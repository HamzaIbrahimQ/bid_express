import 'dart:convert';
import 'package:bid_express/models/requests/update_parts/update_parts_request.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/part/part_response.dart';
import 'package:bid_express/models/responses/refresh_token/refresh_token_response.dart';
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

  Future<MainResponse<List<PartResponse>>?> addParts({
    required int categoryId,
    required UpdatePartsRequest updatePartsRequest,
  }) async {
    MainResponse<List<PartResponse>> _apiResponse =
        MainResponse<List<PartResponse>>();
    final String _token = await getAccessToken();
    String? _refreshedToken;
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_refreshedToken ?? _token}',
    };
    try {
      final response = await http.put(
        Uri.parse(
            '${baseUrl}Seller/UpdateSellerPartConfiguration/Id?sellerCategoryId=$categoryId'),
        headers: _headers,
        body: json.encode(updatePartsRequest.toJson()),
      );
      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
            await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return addParts(
          categoryId: categoryId,
          updatePartsRequest: updatePartsRequest,
        );
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
}
