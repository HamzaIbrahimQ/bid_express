import 'package:bid_express/models/responses/login/login_response.dart';
import 'package:bid_express/models/responses/response_errors/response_errors.dart';
import 'package:bid_express/models/responses/signup/signup_response.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MainResponse<T> {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'message')
  String? message;

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

    mainResponse.status = json['status'] as String?;
    mainResponse.title = json['title'] as String?;
    mainResponse.message = json['message'] as String?;
    mainResponse.responseError =
        mainResponse.data = ResponseErrors.fromJson(json['errors']);

    if (json['data'] != null && mainResponse.responseError != null) {
      return mainResponse;
    }
    if (T == SignupResponse) {
      mainResponse.data = SignupResponse.fromJson(json['data']);
    }

    if (T == LoginResponse) {
      mainResponse.data = LoginResponse.fromJson(json['data']);
    }
    // else if (T == List<Appointment>) {
      //   mainResponse.data = (json['data'] as List<dynamic>)
      //       .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
      //       .toList();
      // }
    else {
      mainResponse.data = json['data'];
    }
    return mainResponse;
  }
}
