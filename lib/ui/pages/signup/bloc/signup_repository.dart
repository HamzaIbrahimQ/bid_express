import 'dart:convert';
import 'package:bid_express/models/requests/signup/signup_request.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/refresh_token/refresh_token_response.dart';
import 'package:bid_express/models/responses/signup/signup_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class SignupRepository extends BaseRepository {
  Future<MainResponse?> sendOtp({required String mobileNum}) async {
    MainResponse _mainResponse = MainResponse();
    String? _refreshedToken;
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final request = http.Request(
        'POST',
        Uri.parse(
            '${baseUrl}MobileOtp/SendOtp?mobileNumber=$mobileNum&mobileAreaCode=962'));
    request.headers.addAll(headers);
    try {
      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
            await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return sendOtp(mobileNum: mobileNum);
      } else {
        final String apiResponse = await response.stream.bytesToString();
        log(response.request.toString() +
            '\n' +
            json.encode(request.body) +
            '\n' +
            (response.reasonPhrase ?? '') +
            '\n' +
            apiResponse);
        _mainResponse = MainResponse.fromJson(json.decode(apiResponse));
        return _mainResponse;
      }
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }

  Future<MainResponse<SignupResponse>?> signup(
      {required SignupRequest signupRequest}) async {
    MainResponse<SignupResponse> _mainResponse = MainResponse<SignupResponse>();
    String? _refreshedToken;
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final request =
        http.Request('POST', Uri.parse('${baseUrl}Seller/CreateSeller'));
    request.headers.addAll(headers);
    request.body = json.encode(signupRequest.toJson());
    try {
      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 401) {
        final RefreshTokenResponse? _refreshTokenResponse =
        await callRefreshToken();
        _refreshedToken = _refreshTokenResponse?.accessToken ?? '';
        return signup(signupRequest: signupRequest);
      } else {
        final String apiResponse = await response.stream.bytesToString();

        log(response.request.toString() +
            '\n' +
            json.encode(request.body) +
            '\n' +
            (response.reasonPhrase ?? '') +
            '\n' +
            apiResponse);
        _mainResponse = MainResponse.fromJson(json.decode(apiResponse));
        return _mainResponse;
      }
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }
}
