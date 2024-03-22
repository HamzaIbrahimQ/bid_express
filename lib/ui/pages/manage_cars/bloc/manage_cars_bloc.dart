import 'dart:async';

import 'package:bid_express/models/requests/add_categories/add_categories_request.dart';
import 'package:bid_express/models/responses/category/category_response.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/models/responses/selected_category/selected_category.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_cars_event.dart';

part 'manage_cars_state.dart';

class ManageCarsBloc extends Bloc<ManageCarsEvent, ManageCarsState>
    with Utility {
  final ManageCarsRepository _manageCarsRepository = ManageCarsRepository();
  List<GetCarsResponse> cars = [];
  List<CategoryResponse> categories = [];
  List<SelectedCategory> selectedCategories = [];
  final AddCategoriesRequest _addCategoriesRequest = AddCategoriesRequest();

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

    on<SelectBrand>((event, emit) {
      _selectBrand(brandId: event.brandId);
    });

    on<UpdateSelectedBrand>((event, emit) {
      emit.call(UpdateSelectedBrandState());
    });

    on<SelectModel>((event, emit) {
      _selectModel(modelId: event.modelId);
    });

    on<UpdateSelectedModel>((event, emit) {
      emit.call(UpdateSelectedModelState(modelId: event.modelId));
    });

    on<GetCategories>((event, emit) {
      _getCategories();
    });

    on<GetCategoriesLoading>((event, emit) {
      emit.call(GetCategoriesLoadingState());
    });

    on<GetCategoriesSuccess>((event, emit) {
      emit.call(GetCategoriesSuccessState());
    });

    on<GetCategoriesError>((event, emit) {
      emit.call(GetCategoriesErrorState(error: event.error));
    });

    on<GetCategoriesFailure>((event, emit) {
      emit.call(GetCategoriesFailureState());
    });

    on<GetSelectedCategories>((event, emit) {
      _getSelectedCategories(modelId: event.modelId);
    });

    on<GetSelectedCategoriesLoading>((event, emit) {
      emit.call(GetSelectedCategoriesLoadingState());
    });

    on<GetSelectedCategoriesSuccess>((event, emit) {
      emit.call(GetSelectedCategoriesSuccessState());
    });

    on<GetSelectedCategoriesError>((event, emit) {
      emit.call(GetSelectedCategoriesErrorState(error: event.error));
    });

    on<GetSelectedCategoriesFailure>((event, emit) {
      emit.call(GetSelectedCategoriesFailureState());
    });

    on<SelectUnSelectCategory>((event, emit) {
      _selectUnselectCategory(id: event.id);
    });

    on<SelectUnSelectCategorySuccess>((event, emit) {
      emit.call(
          SelectUnSelectCategorySuccessState(clearFields: event.clearFields));
    });

    on<UpdateModelYear>((event, emit) {
      try {
        final item = cars
            .firstWhere((element) => element.isSelected == true)
            .sellerCarModels
            ?.firstWhere((element) => element?.isSelected == true);
        item?.yearFrom = event.from;
        item?.yearTo = event.to;
      } catch (e) {
        print(e.toString());
      }
    });

    on<AddCategories>((event, emit) {
      _addCategories(event);
    });

    on<AddCategoriesLoading>((event, emit) {
      emit.call(AddCategoriesLoadingState());
    });

    on<AddCategoriesSuccess>((event, emit) {
      emit.call(AddCategoriesSuccessState());
    });

    on<AddCategoriesError>((event, emit) {
      emit.call(AddCategoriesErrorState(error: event.error));
    });

    on<AddCategoriesFailure>((event, emit) {
      emit.call(AddCategoriesFailureState());
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
            if (value?.data.isNotEmpty ?? false) {
              cars.clear();
              cars.addAll(value?.data);
            }
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

  Future<void> _getCategories() async {
    add(GetCategoriesLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _manageCarsRepository.getCategories().then((value) async {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              categories.clear();
              categories.addAll(value?.data);
            }
            add(GetCategoriesSuccess());
          } else {
            add(GetCategoriesError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetCategoriesError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetCategoriesError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetCategoriesFailure());
    }
  }

  Future<void> _getSelectedCategories({required int modelId}) async {
    add(GetSelectedCategoriesLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _manageCarsRepository
            .getSelectedCategories(modelId: modelId)
            .then((value) {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              selectedCategories.clear();
              categories.forEach((element) {
                element.isSelected = false;
              });
              selectedCategories.addAll(value?.data);
              categories.forEach((category) {
                try {
                  selectedCategories.firstWhere(
                      (element) => element.categoryId == category.id);
                  category.isSelected = true;
                } catch (e) {}
              });
            }

            add(GetSelectedCategoriesSuccess());
          } else {
            add(GetSelectedCategoriesError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetSelectedCategoriesError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetSelectedCategoriesError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetSelectedCategoriesFailure());
    }
  }

  void _selectBrand({required int brandId}) {
    cars.forEach((element) {
      if (element.brandId == brandId) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    });
    add(UpdateSelectedBrand());
  }

  void _selectModel({required int modelId}) {
    final item = cars.firstWhere((element) => element.isSelected ?? false);
    item.sellerCarModels?.forEach((element) {
      if (element?.carModelId == modelId) {
        element?.isSelected = true;
      } else {
        element?.isSelected = false;
      }
    });
    add(UpdateSelectedModel(modelId: modelId));
  }

  void _selectUnselectCategory({required int id}) {
    categories.forEach((element) {
      if (element.id == id) {
        element.isSelected = !(element.isSelected ?? false);
      }
    });
    _addOrRemoveCategoryIdToModel(id: id);
    add(SelectUnSelectCategorySuccess());
  }

  void _addOrRemoveCategoryIdToModel({required int id}) {
    try {
      final model = cars
          .firstWhere((element) => element.isSelected == true)
          .sellerCarModels
          ?.firstWhere((model) => model?.isSelected == true);
      if ((model?.selectedCategoriesIds != null) &&
          (model?.selectedCategoriesIds?.contains(id) ?? false)) {
        model?.selectedCategoriesIds?.removeWhere((element) => element == id);
      } else {
        model?.selectedCategoriesIds ??= [];
        model?.selectedCategoriesIds?.add(id);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _addCategories(AddCategories event) async {
    cars.forEach((car) {
      car.sellerCarModels?.forEach((model) {
        model?.selectedCategoriesIds?.forEach((categoryId) {
          _addCategoriesRequest.sellerCategories ??= [];
          _addCategoriesRequest.sellerCategories
              ?.add(AddCategoriesRequestSellerCategories(
            categoryId: categoryId,
            sellerCarModelId: model.carModelId,
            fromYear: int.tryParse(model.yearFrom ?? '0'),
            toYear: int.tryParse(model.yearTo ?? '0'),
            parts: [],
          ));
        });
      });
    });

    if (_addCategoriesRequest.sellerCategories == null ||
        (_addCategoriesRequest.sellerCategories?.isEmpty ?? false)) {
      return;
    }
    add(AddCategoriesLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _manageCarsRepository
            .addCategories(request: _addCategoriesRequest)
            .then((value) async {
          if (value?.isSuccess ?? false) {
            if (value?.data.isNotEmpty ?? false) {
              categories.clear();
              categories.addAll(value?.data);
            }
            add(AddCategoriesSuccess());
          } else {
            add(AddCategoriesError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(AddCategoriesError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(AddCategoriesError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(AddCategoriesFailure());
    }
  }
}
