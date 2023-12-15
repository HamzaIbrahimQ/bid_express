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
  Future<LoginResponse?> login(
      {required LoginRequest loginRequest}) async {
    LoginResponse _mainResponse = LoginResponse();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final request = http.Request('POST', Uri.parse('${baseUrl}User/Login'));
    request.headers.addAll(headers);
    request.body = json.encode(loginRequest.toJson());
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
      _mainResponse = LoginResponse.fromJson(json.decode(apiResponse));
      return _mainResponse;
    } catch (e) {
      errorLog(e.toString());
      return null;
    }
  }
}
