import 'package:bid_express/models/responses/signup/signup_response.dart';
import 'package:bid_express/models/responses/validation_messages/response_errors.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MainResponse<T> {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'message')
  String? message;

  ResponseError? responseError;

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
        mainResponse.data = ResponseError.fromJson(json['errors']);

    if (json['data'] != null && mainResponse.responseError != null) {
      return mainResponse;
    }
    if (T == SignupResponse) {
      mainResponse.data = SignupResponse.fromJson(json['data']);
    }
    // else if (T == VerifyUserResponse) {
    //   mainResponse.data = VerifyUserResponse.fromJson(json['data']);
    // } else if (T == ChangePasswordResponse) {
    //   mainResponse.data = ChangePasswordResponse.fromJson(json['data']);
    // } else if (T == User) {
    //   mainResponse.data = User.fromJson(json['data']);
    // } else if (T == List<Country>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Country.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Appointment>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Child>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Child.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Allergy>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Allergy.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Disease>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Disease.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Notification>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Notification.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == Doctor) {
    //   mainResponse.data = Doctor.fromJson(json['data']);
    // } else if (T == List<Doctor>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<AvailableTime>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => AvailableTime.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Article>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Article.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Leaflet>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Leaflet.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Medicine>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Medicine.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<PaymentMethod>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<LiveSession>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => LiveSession.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == List<Nursery>) {
    //   mainResponse.data = (json['data'] as List<dynamic>)
    //       .map((e) => Nursery.fromJson(e as Map<String, dynamic>))
    //       .toList();
    // } else if (T == Wallet) {
    //   mainResponse.data = Wallet.fromJson(json['data']);
    // }
    else {
      mainResponse.data = json['data'];
    }
    return mainResponse;
  }
}
