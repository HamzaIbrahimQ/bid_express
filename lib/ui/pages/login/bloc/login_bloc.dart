import 'dart:async';

import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/models/requests/login/login_request.dart';
import 'package:bid_express/ui/pages/login/bloc/login_repository.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with Utility {
  final LoginRepository _loginRepository = LoginRepository();
  final LoginRequest loginRequest = LoginRequest();
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) {
      _login(event);
    });

    on<LoginLoadingEvent>((event, emit) {
      emit.call(LoginLoadingState());
    });

    on<LoginSuccessEvent>((event, emit) {
      emit.call(LoginSuccessState());
    });

    on<LoginErrorEvent>((event, emit) {
      emit.call(LoginErrorState(error: event.error));
    });

    on<LoginFailureEvent>((event, emit) {
      emit.call(LoginFailureState());
    });
  }

  Future<void> _login(Login event) async {
    add(LoginLoadingEvent());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        loginRequest.langCode = 'en';
        _loginRepository.login(loginRequest: loginRequest).then(
          (value) async {
            if (value?.isSuccess ?? false) {
              add(LoginSuccessEvent());
              print('access token:\n${value?.accessToken}');
              print('refresh token:\n${value?.refreshToken}');
              await _sharedPreferenceHelper.saveStringValue(
                key: 'accessToken',
                value: value?.accessToken,
              );
              await _sharedPreferenceHelper.saveStringValue(
                key: 'refreshToken',
                value: value?.refreshToken,
              );
              await _sharedPreferenceHelper.saveStringValue(
                key: 'userName',
                value: loginRequest.userName,
              );
            } else {
              add(LoginErrorEvent(error: value?.errorMessage));
            }
          },
        ).catchError((e) {
          errorLog(e.toString());
          add(LoginErrorEvent(error: e.toString()));
        });
        ;
      } catch (error) {
        errorLog(error.toString());
        add(LoginErrorEvent(error: error.toString()));
      }
    } else {
      // no internet connection
      add(LoginFailureEvent());
    }
  }
}
