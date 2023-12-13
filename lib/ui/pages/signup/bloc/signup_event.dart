part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class UpdateLocationFields extends SignupEvent {}

class SendOtp extends SignupEvent {}

class SendOtpLoadingEvent extends SignupEvent {
  SendOtpLoadingEvent();
}

class SendOtpSuccessEvent extends SignupEvent {
  final String? message;

  SendOtpSuccessEvent({this.message});
}

class SendOtpErrorEvent extends SignupEvent {
  final String? error;

  SendOtpErrorEvent({this.error});
}

class SendOtpFailureEvent extends SignupEvent {
  SendOtpFailureEvent();
}

class Signup extends SignupEvent {}

class SignupLoadingEvent extends SignupEvent {
  SignupLoadingEvent();
}

class SignupSuccessEvent extends SignupEvent {

}

class SignupErrorEvent extends SignupEvent {
  final String? error;
  final ResponseErrors? responseErrors;

  SignupErrorEvent({this.error, this.responseErrors});
}

class SignupFailureEvent extends SignupEvent {
  SignupFailureEvent();
}
