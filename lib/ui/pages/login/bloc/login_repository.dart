import 'dart:convert';
import 'package:bid_express/models/requests/login/login_request.dart';
import 'package:bid_express/models/requests/signup/signup_request.dart';
import 'package:bid_express/models/responses/login/login_response.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/refresh_token/refresh_token_response.dart';
import 'package:bid_express/models/responses/signup/signup_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends BaseRepository {
  Future<MainResponse<LoginResponse>?> login(
      {required LoginRequest loginRequest}) async {
    MainResponse<LoginResponse> _mainResponse = MainResponse<LoginResponse>();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final request = http.Request('POST', Uri.parse('${baseUrl}User/Login'));
    request.headers.addAll(headers);
    try {
      final http.StreamedResponse response = await request.send();

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
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }
}
