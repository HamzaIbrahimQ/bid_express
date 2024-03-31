import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<GetInitValues>((event, emit) {
      _getInitValues();
    });

    on<GetInitValuesSuccess>((event, emit) {
      emit.call(
        GetInitValuesSuccessState(
          accessToken: event.accessToken,
          isFirstRun: event.isFirstRun,
        ),
      );
    });
  }

  Future<void> _getInitValues() async {
    Future.wait([
      Future.delayed(const Duration(seconds: 3)),
      _getAccessToken(),
      _getFirstRun(),
    ]).then((value) {
      if (value[2]) {
        SharedPreferenceHelper().saveStringValue(key: 'accessToken', value: '');
      }
      add(GetInitValuesSuccess(accessToken: value[1], isFirstRun: value[2]));
    });
  }

  Future<String> _getAccessToken() async {
    return await SharedPreferenceHelper().getStringValue(key: 'accessToken');
  }

  Future<bool> _getFirstRun() async {
    return await SharedPreferenceHelper().getBooleanValue(key: 'isFirstRun') ??
        true;
  }
}
