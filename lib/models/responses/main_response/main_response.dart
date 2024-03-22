import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/models/responses/category/category_response.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/models/responses/login/login_response.dart';
import 'package:bid_express/models/responses/orders/get_orders_response.dart';
import 'package:bid_express/models/responses/part/part_response.dart';
import 'package:bid_express/models/responses/part_addition/part_addition_response.dart';
import 'package:bid_express/models/responses/response_errors/response_errors.dart';
import 'package:bid_express/models/responses/selected_category/selected_category.dart';
import 'package:bid_express/models/responses/signup/signup_response.dart';
import 'package:bid_express/models/responses/user/user_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MainResponse<T> {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'errorMessage')
  String? errorMessage;

  @JsonKey(name: 'isSuccess')
  bool? isSuccess;

  ResponseErrors? responseError;

  @JsonKey(name: 'data')
  dynamic data;

  MainResponse({
    this.status,
    this.message,
    this.responseError,
    this.data,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    final MainResponse<T> mainResponse = MainResponse<T>();

    mainResponse.status = json['status'] as int?;
    mainResponse.title = json['title'] as String?;
    mainResponse.message = json['message'] as String?;
    mainResponse.errorMessage = json['errorMessage'] as String?;
    mainResponse.isSuccess = json['isSuccess'] as bool?;
    if (json.containsKey('errors') && json['errors'] != null) {
      mainResponse.responseError = ResponseErrors.fromJson(json['errors']);
    }

    if (json.containsKey('data') && json['data'] == null) {
      json['data'] = <String, dynamic>{};
    }

    if (json.containsKey('data') &&
        json['data'] != null &&
        mainResponse.responseError != null) {
      return mainResponse;
    }

    if (json.containsKey('data') && T == LoginResponse) {
      mainResponse.data = LoginResponse.fromJson(json['data']);
    } else if (json.containsKey('data') && T == SignupResponse) {
      mainResponse.data = SignupResponse.fromJson(json['data']);
    } else if (json.containsKey('data') && T == GetOrdersResponse) {
      mainResponse.data = GetOrdersResponse.fromJson(json['data']);
    } else if (json.containsKey('data') && T == UserData) {
      mainResponse.data = UserData.fromJson(json['data']);
    } else if (json.containsKey('data') && T == List<CategoryResponse>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (json.containsKey('data') && T == List<GetCarsResponse>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => GetCarsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (json.containsKey('data') && T == List<PartResponse>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => PartResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (json.containsKey('data') && T == List<PartAdditionResponse>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => PartAdditionResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (json.containsKey('data') && T == List<CarBrandResponse>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => CarBrandResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (json.containsKey('data') && T == List<CarModelResponse>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => CarModelResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (json.containsKey('data') && T == List<SelectedCategory>) {
      mainResponse.data = (json['data'] as List<dynamic>)
          .map((e) => SelectedCategory.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      mainResponse.data = json['data'] ?? {};
    }
    return mainResponse;
  }
}
