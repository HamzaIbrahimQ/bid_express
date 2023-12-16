import 'dart:async';

import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_cars_event.dart';
part 'manage_cars_state.dart';

class ManageCarsBloc extends Bloc<ManageCarsEvent, ManageCarsState> with Utility {
  final ManageCarsRepository _manageCarsRepository = ManageCarsRepository();
  List<GetCarsResponse> cars = [];

  ManageCarsBloc() : super(ManageCarsInitial()) {
    on<GetCars>((event, emit) {
      _getCars();
    });

    on<GetCarsLoading>((event, emit) {
      emit.call(GetCarsLoadingState());
    });

    on<GetCarsSuccess>((event, emit) {
      emit.call(GetCarsSuccessState());
    });

    on<GetCarsError>((event, emit) {
      emit.call(GetCarsErrorState(error: event.error));
    });

    on<GetCarsFailure>((event, emit) {
      emit.call(GetCarsFailureState());
    });
  }


  Future<void> _getCars() async {
    add(GetCarsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _manageCarsRepository.getCars().then((value) async {
          if (value?.isSuccess ?? false) {
            cars.clear();
            cars.addAll(value?.data);
            add(GetCarsSuccess());
          } else {
            add(GetCarsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetCarsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetCarsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetCarsFailure());
    }
  }
}
