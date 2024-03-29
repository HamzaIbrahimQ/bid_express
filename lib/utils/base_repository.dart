import 'dart:convert';
import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/models/requests/refresh_token/refresh_token_request.dart';
import 'package:bid_express/models/responses/refresh_token/refresh_token_response.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:http/http.dart' as http;

class BaseRepository with Utility {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();
  final String baseUrl = 'https://bidexpress-app.azurewebsites.net/api/';

  Future<String> getAccessToken() async {
    try {
      final String token =
          await _sharedPreferenceHelper.getStringValue(key: 'accessToken');
      return token;
    } catch (e) {
      return '';
    }
  }

  Future<String> getRefreshToken() async {
    try {
      final String token =
          await _sharedPreferenceHelper.getStringValue(key: 'refreshToken');
      return token;
    } catch (e) {
      return '';
    }
  }

  Future<String> getFcmToken() async {
    try {
      final String _token =
          await _sharedPreferenceHelper.getStringValue(key: 'fcm_token');
      print('fcmToken : $_token');
      return _token;
    } catch (e) {
      return '';
    }
  }

  Future<String> getDeviceId() async {
    try {
      final String _deviceId =
          await _sharedPreferenceHelper.getStringValue(key: 'device_id');
      print('deviceId : $_deviceId');
      return _deviceId;
    } catch (e) {
      return '';
    }
  }

  Future<RefreshTokenResponse?> callRefreshToken() async {
    RefreshTokenResponse _apiResponse = RefreshTokenResponse();
    final RefreshTokenRequest _refreshTokenRequest = RefreshTokenRequest();
    final _headers = {
      'Content-Type': 'application/json',
    };
    try {
      _refreshTokenRequest.langCode = 'en';
      _refreshTokenRequest.accessToken = await getAccessToken();
      _refreshTokenRequest.refreshToken = await getRefreshToken();
      final _response = await http.post(
        Uri.parse('${baseUrl}User/RefreshToken'),
        headers: _headers,
        body: json.encode(_refreshTokenRequest.toJson()),
      );
      log(json.encode(_refreshTokenRequest.toJson()));
      log(_response.request.toString() +
          '\n' +
          _refreshTokenRequest.toJson().toString() +
          '\n' +
          _response.statusCode.toString() +
          '\n' +
          json.encode(_response.body));

      _apiResponse = RefreshTokenResponse.fromJson(json.decode(_response.body));
      if (_apiResponse.accessToken != null) {
        await _sharedPreferenceHelper.saveStringValue(
          key: 'accessToken',
          value: _apiResponse.accessToken,
        );
        await _sharedPreferenceHelper.saveStringValue(
          key: 'refreshToken',
          value: _apiResponse.refreshToken,
        );
      }
      return _apiResponse;
    } catch (e) {
      errorLog(e.toString());
      return _apiResponse;
    }
  }

  Future<int?> getSellerId() async {
    try {
      final int? _sellerId =
      await _sharedPreferenceHelper.getIntValue(key: 'sellerId');
      print('sellerId : $_sellerId');
      return _sellerId;
    } catch (e) {
      return 0;
    }
  }
}
