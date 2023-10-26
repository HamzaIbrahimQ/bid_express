part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class SubmitOtpLoadingState extends OtpState {}

class SubmitOtpSuccessState extends OtpState {}

class SubmitOtpErrorState extends OtpState {
  final String? error;

  SubmitOtpErrorState({this.error});
}

class SubmitOtpFailedState extends OtpState {}

class ResendOtpLoadingState extends OtpState {}

class ResendOtpSuccessState extends OtpState {}

class ResendOtpErrorState extends OtpState {
  final String? error;

  ResendOtpErrorState({this.error});
}

class ResendOtpFailedState extends OtpState {}
