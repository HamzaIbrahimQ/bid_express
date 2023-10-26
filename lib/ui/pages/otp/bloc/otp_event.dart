part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class SubmitOtp extends OtpEvent {}

class SubmitOtpLoading extends OtpEvent {}

class SubmitOtpSuccess extends OtpEvent {}

class SubmitOtpError extends OtpEvent {
  final String? error;

  SubmitOtpError({this.error});
}

class SubmitOtpFailed extends OtpEvent {}


class ResendOtp extends OtpEvent {}

class ResendOtpLoading extends OtpEvent {}

class ResendOtpSuccess extends OtpEvent {}

class ResendOtpError extends OtpEvent {
  final String? error;

  ResendOtpError({this.error});
}

class ResendOtpFailed extends OtpEvent {}
