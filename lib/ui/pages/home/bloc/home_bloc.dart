import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/models/responses/user/user_data_model.dart';
import 'package:bid_express/ui/pages/home/bloc/home_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with Utility {
  final HomeRepository _homeRepository = HomeRepository();
  UserData? userData;


  HomeBloc() : super(HomeInitial()) {
    on<GetUserData>((event, emit) {
      _getUserData();
    });

    on<GetUserDataLoading>((event, emit) {
      emit.call(GetUserDataLoadingState());
    });

    on<GetUserDataSuccess>((event, emit) {
      emit.call(GetUserDataSuccessState());
    });

    on<GetUserDataError>((event, emit) {
      emit.call(GetUserDataErrorState());
    });

    on<GetUserDataFailure>((event, emit) {
      emit.call(GetUserDataFailureState());
    });
  }

  Future<void> _getUserData() async {
    add(GetUserDataLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _homeRepository.getUserData().then((value) async {
          if (value?.isSuccess ?? false) {
            userData = value?.data;
            add(GetUserDataSuccess());
          } else {
            add(GetUserDataError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetUserDataError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetUserDataError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetUserDataFailure());
    }
  }


}
