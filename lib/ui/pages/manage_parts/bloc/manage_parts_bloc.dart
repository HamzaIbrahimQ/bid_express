import 'dart:async';

import 'package:bid_express/models/responses/part/part_response.dart';
import 'package:bid_express/ui/pages/manage_parts/bloc/manage_parts_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_parts_event.dart';

part 'manage_parts_state.dart';

class ManagePartsBloc extends Bloc<ManagePartsEvent, ManagePartsState>
    with Utility {
  final ManagePartsRepository _managePartsRepository = ManagePartsRepository();
  final List<PartResponse> parts = [];

  ManagePartsBloc() : super(ManagePartsInitial()) {
    on<GetParts>((event, emit) {
      _getParts(categoryId: event.categoryId);
    });

    on<GetPartsLoading>((event, emit) {
      emit.call(GetPartsLoadingState());
    });

    on<GetPartsSuccess>((event, emit) {
      emit.call(GetPartsSuccessState());
    });

    on<GetPartsError>((event, emit) {
      emit.call(GetPartsErrorState(error: event.error));
    });

    on<GetPartsFailure>((event, emit) {
      emit.call(GetPartsFailureState());
    });

    on<GetSelectedParts>((event, emit) {
      _getParts(categoryId: event.categoryId);
    });

    on<GetSelectedPartsLoading>((event, emit) {
      emit.call(GetSelectedPartsLoadingState());
    });

    on<GetSelectedPartsSuccess>((event, emit) {
      emit.call(GetSelectedPartsSuccessState());
    });

    on<GetSelectedPartsError>((event, emit) {
      emit.call(GetSelectedPartsErrorState(error: event.error));
    });

    on<GetSelectedPartsFailure>((event, emit) {
      emit.call(GetSelectedPartsFailureState());
    });
  }

  Future<void> _getParts({required int categoryId}) async {
    add(GetPartsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _managePartsRepository
            .getParts(categoryId: categoryId)
            .then((value)  {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              parts.clear();
              parts.addAll(value?.data);
            }
            add(GetPartsSuccess());
          } else {
            add(GetPartsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetPartsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetPartsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetPartsFailure());
    }
  }

  Future<void> _getSelectedParts() async {
    add(GetPartsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _managePartsRepository
            .getSelectedParts()
            .then((value)  {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              parts.clear();
              parts.addAll(value?.data);
            }
            add(GetPartsSuccess());
          } else {
            add(GetPartsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetPartsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetPartsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetPartsFailure());
    }
  }
}
