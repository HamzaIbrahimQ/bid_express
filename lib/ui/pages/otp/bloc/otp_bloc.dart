import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<SubmitOtp>((event, emit) {
      /// call api
    });

    on<SubmitOtpLoading>((event, emit) {
      emit.call(SubmitOtpLoadingState());
    });

    on<SubmitOtpSuccess>((event, emit) {
      emit.call(SubmitOtpSuccessState());
    });

    on<SubmitOtpError>((event, emit) {
      emit.call(SubmitOtpErrorState(error: event.error));
    });

    on<SubmitOtpFailed>((event, emit) {
      emit.call(SubmitOtpFailedState());
    });

    on<ResendOtp>((event, emit) {
      /// call api
    });

    on<ResendOtpLoading>((event, emit) {
      emit.call(ResendOtpLoadingState());
    });

    on<ResendOtpSuccess>((event, emit) {
      emit.call(ResendOtpSuccessState());
    });

    on<ResendOtpError>((event, emit) {
      emit.call(ResendOtpErrorState(error: event.error));
    });

    on<ResendOtpFailed>((event, emit) {
      emit.call(ResendOtpFailedState());
    });
  }
}
