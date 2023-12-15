import 'dart:convert';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/user/user_data_model.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class HomeRepository extends BaseRepository {

  Future<MainResponse<UserData>?> getUserData() async {
    MainResponse<UserData> _apiResponse = MainResponse<UserData>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http.get(Uri.parse('${baseUrl}User/GetUser'),
          headers: _headers);

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
}
