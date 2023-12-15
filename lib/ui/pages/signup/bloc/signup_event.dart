part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class UpdateLocationFields extends SignupEvent {}

class SendOtp extends SignupEvent {

}

class SendOtpLoadingEvent extends SignupEvent {}

class SendOtpSuccessEvent extends SignupEvent {
  final String? message;

  SendOtpSuccessEvent({this.message});
}

class SendOtpErrorEvent extends SignupEvent {
  final String? error;

  SendOtpErrorEvent({this.error});
}

class SendOtpFailureEvent extends SignupEvent {}

class ReSendOtp extends SignupEvent {

}

class ReSendOtpLoadingEvent extends SignupEvent {}

class ReSendOtpSuccessEvent extends SignupEvent {
  final String? message;

  ReSendOtpSuccessEvent({this.message});
}

class ReSendOtpErrorEvent extends SignupEvent {
  final String? error;

  ReSendOtpErrorEvent({this.error});
}

class ReSendOtpFailureEvent extends SignupEvent {}

class Signup extends SignupEvent {}

class SignupLoadingEvent extends SignupEvent {
  SignupLoadingEvent();
}

class SignupSuccessEvent extends SignupEvent {}

class SignupErrorEvent extends SignupEvent {
  final String? error;
  final ResponseErrors? responseErrors;

  SignupErrorEvent({this.error, this.responseErrors});
}

class SignupFailureEvent extends SignupEvent {
  SignupFailureEvent();
}
