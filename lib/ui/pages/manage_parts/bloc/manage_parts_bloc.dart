import 'dart:async';

import 'package:bid_express/models/requests/update_parts/update_parts_request.dart';
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
  List<int?>? selectedPartsIds;
  UpdatePartsRequest? updatePartsRequest;

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

    on<AddParts>((event, emit) {
      _addParts(categoryId: event.categoryId);
    });

    on<AddPartsLoading>((event, emit) {
      emit.call(AddPartsLoadingState());
    });

    on<AddPartsSuccess>((event, emit) {
      emit.call(AddPartsLoadingState());
    });

    on<AddPartsError>((event, emit) {
      emit.call(AddPartsErrorState(error: event.error));
    });

    on<AddPartsFailure>((event, emit) {
      emit.call(AddPartsFailureState());
    });

    on<SelectUnselectPart>((event, emit) {
      _selectUnselectPart(partId: event.partId);
    });

    on<SelectUnselectPartSuccess>((event, emit) {
      emit.call(SelectUnselectPartSuccessState());
    });
  }

  Future<void> _getParts({required int categoryId}) async {
    add(GetPartsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _managePartsRepository.getParts(categoryId: categoryId).then((value) {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              parts.clear();
              parts.addAll(value?.data);
              _checkSelectedParts();
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

  Future<void> _addParts({required int categoryId}) async {
    if (updatePartsRequest == null) return;
    add(AddPartsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _managePartsRepository
            .addParts(
                categoryId: categoryId, updatePartsRequest: updatePartsRequest!)
            .then((value) {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              parts.clear();
              parts.addAll(value?.data);
              _checkSelectedParts();
            }
            add(AddPartsSuccess());
          } else {
            add(AddPartsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(AddPartsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(AddPartsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(AddPartsFailure());
    }
  }

  void _checkSelectedParts() {
    if (selectedPartsIds != null && (selectedPartsIds?.isNotEmpty ?? false)) {
      parts.forEach((element) {
        if (selectedPartsIds?.contains(element.id) ?? false) {
          element.isSelected = true;
        }
      });
    }
  }

  void _selectUnselectPart({required int partId}) {
    parts.firstWhere((element) => element.id == partId).isSelected = !(parts.firstWhere((element) => element.id == partId).isSelected ?? false);
    add(SelectUnselectPartSuccess());
  }

// Future<void> _getSelectedParts() async {
//   add(GetPartsLoading());
//   final bool _isConnected = await checkInternetConnection();
//   if (_isConnected) {
//     try {
//       // internet connection available
//       _managePartsRepository
//           .getSelectedParts()
//           .then((value)  {
//         if (value?.isSuccess ?? false) {
//           if (value?.data.isNotEmpty ?? false) {
//             parts.clear();
//             parts.addAll(value?.data);
//           }
//           add(GetPartsSuccess());
//         } else {
//           add(GetPartsError(error: value?.errorMessage));
//         }
//       }).catchError((e) {
//         errorLog(e.toString());
//         add(GetPartsError(error: e.toString()));
//       });
//     } catch (error) {
//       errorLog(error.toString());
//       add(GetPartsError(error: error.toString()));
//     }
//   } else {
//     // no internet connection
//     add(GetPartsFailure());
//   }
// }
}
