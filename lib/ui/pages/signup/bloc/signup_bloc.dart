import 'dart:async';

import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/models/requests/signup/signup_request.dart';
import 'package:bid_express/models/responses/response_errors/response_errors.dart';
import 'package:bid_express/ui/pages/signup/bloc/signup_repository.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> with Utility {
  final SignupRepository _signupRepository = SignupRepository();
  final SignupRequest signupRequest = SignupRequest();
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  SignupBloc() : super(SignupInitial()) {
    on<UpdateLocationFields>((event, emit) {
      emit(UpdateLocationFieldsState());
    });

    on<SendOtp>((event, emit) {
      _sendOtp(event);
    });

    on<SendOtpLoadingEvent>((event, emit) {
      emit.call(SendOtpLoadingState());
    });

    on<SendOtpSuccessEvent>((event, emit) {
      emit.call(SendOtpSuccessState(message: event.message));
    });

    on<SendOtpErrorEvent>((event, emit) {
      emit.call(SendOtpErrorState(error: event.error));
    });
    on<SendOtpFailureEvent>((event, emit) {
      emit.call(SendOtpFailureState());
    });

    on<Signup>((event, emit) {
      _signup(event);
    });

    on<SignupLoadingEvent>((event, emit) {
      emit.call(SignupLoadingState());
    });

    on<SignupSuccessEvent>((event, emit) {
      emit.call(SignupSuccessState(message: event.message));
    });

    on<SignupErrorEvent>((event, emit) {
      emit.call(SignupErrorState(
          error: event.error, responseErrors: event.responseErrors));
    });

    on<SignupFailureEvent>((event, emit) {
      emit.call(SignupFailureState());
    });
  }

  Future<void> _sendOtp(SendOtp event) async {
    add(SendOtpLoadingEvent());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _signupRepository
            .sendOtp(mobileNum: signupRequest.mobileNumber ?? '')
            .then((value) {
          if (value?.status == 'Success') {
            add(SendOtpSuccessEvent(message: value?.message ?? ''));
          } else {
            add(SendOtpErrorEvent(error: value?.message));
          }
        });
      } catch (error) {
        errorLog(error.toString());
        add(SendOtpErrorEvent(error: error.toString()));
      }
    } else {
      // no internet connection

      add(SendOtpFailureEvent());
    }
  }

  Future<void> _signup(Signup event) async {
    add(SignupLoadingEvent());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _signupRepository
            .signup(signupRequest: signupRequest)
            .then((value) async {
          if (value?.status == 'Success') {
            add(SignupSuccessEvent(message: value?.message));

            /// Save user mobile number to send it to reset password API
            await _sharedPreferenceHelper.saveStringValue(
              key: 'mobileNumber',
              value: value?.data.mobileNumber,
            );
          } else {
            add(SignupErrorEvent(
                error: value?.message, responseErrors: value?.responseError));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(SignupErrorEvent(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(SignupErrorEvent(error: error.toString()));
      }
    } else {
      // no internet connection
      add(SignupFailureEvent());
    }
  }


}
