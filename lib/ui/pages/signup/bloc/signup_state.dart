part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class UpdateLocationFieldsState extends SignupState {}

class SignupLoadingState extends SignupState {
  SignupLoadingState();
}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String? error;
  final ResponseErrors? responseErrors;

  SignupErrorState({this.error, this.responseErrors});
}

class SignupFailureState extends SignupState {
  SignupFailureState();
}

class SendOtpLoadingState extends SignupState {}

class SendOtpSuccessState extends SignupState {
  final String? message;

  SendOtpSuccessState({this.message});
}

class SendOtpErrorState extends SignupState {
  final String? error;

  SendOtpErrorState({this.error});
}

class SendOtpFailureState extends SignupState {}

class ReSendOtpLoadingState extends SignupState {}

class ReSendOtpSuccessState extends SignupState {
  final String? message;

  ReSendOtpSuccessState({this.message});
}

class ReSendOtpErrorState extends SignupState {
  final String? error;

  ReSendOtpErrorState({this.error});
}

class ReSendOtpFailureState extends SignupState {}
