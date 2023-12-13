import 'dart:convert';

import 'package:bid_express/models/requests/change_password/change_password_request.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class ChangePasswordRepository extends BaseRepository {
  Future<MainResponse?> changePassword(
      {required ChangePasswordRequest changePasswordRequest}) async {
    MainResponse _apiResponse = MainResponse();
    final String _token = await getAccessToken();
    final _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };

    try {
      final response = await http.post(
        Uri.parse('${baseUrl}User/ChangePassword'),
        headers: _headers,
        body: changePasswordRequest.toJson(),
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
