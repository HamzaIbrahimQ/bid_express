import 'dart:async';
import 'package:bid_express/models/requests/change_password/change_password_request.dart';
import 'package:bid_express/ui/pages/change_password/bloc/change_password_repository.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState>
    with Utility {
  final ChangePasswordRepository _changePasswordRepository =
      ChangePasswordRepository();
  final ChangePasswordRequest changePasswordRequest = ChangePasswordRequest();

  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePassword>((event, emit) {
      _changePassword();
    });

    on<ChangePasswordLoading>((event, emit) {
      emit.call(ChangePasswordLoadingState());
    });

    on<ChangePasswordSuccess>((event, emit) {
      emit.call(ChangePasswordSuccessState());
    });

    on<ChangePasswordError>((event, emit) {
      emit.call(ChangePasswordErrorState());
    });

    on<ChangePasswordFailed>((event, emit) {
      emit.call(ChangePasswordFailedState());
    });
  }

  Future<void> _changePassword() async {
    add(ChangePasswordLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _changePasswordRepository
            .changePassword(changePasswordRequest: changePasswordRequest)
            .then(
          (value) async {
            if (value?.status == 'Success') {
              add(ChangePasswordSuccess());
            } else {
              add(ChangePasswordError(error: value?.message));
            }
          },
        ).catchError((e) {
          errorLog(e.toString());
          add(ChangePasswordError(error: e.toString()));
        });
        ;
      } catch (error) {
        errorLog(error.toString());
        add(ChangePasswordError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(ChangePasswordFailed());
    }
  }
}
