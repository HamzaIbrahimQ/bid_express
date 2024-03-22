import 'dart:convert';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/models/responses/main_response/main_response.dart';
import 'package:bid_express/models/responses/orders/get_orders_response.dart';
import 'package:bid_express/utils/base_repository.dart';
import 'package:http/http.dart' as http;

class OrdersRepository extends BaseRepository {
  Future<MainResponse<GetOrdersResponse>?> getOrders(
      {required int days, required int pageNumber, int pageSize = 20}) async {
    MainResponse<GetOrdersResponse> _apiResponse =
        MainResponse<GetOrdersResponse>();
    final String _token = await getAccessToken();
    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http.get(
        Uri.parse(
            '${baseUrl}Order/SearchOrders?days=$days&pageNumber=$pageNumber&pageSize=$pageSize'),
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
}
