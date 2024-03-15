import 'package:bid_express/models/requests/add_brands/add_brands_request.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_brands_event.dart';

part 'add_brands_state.dart';

class AddBrandsBloc extends Bloc<AddBrandsEvent, AddBrandsState> with Utility {
  final GetBrandsRepository _getBrandsRepository = GetBrandsRepository();
  final AddBrandsRequest addBrandsRequest = AddBrandsRequest(langCode: 'en');
  List<CarBrandResponse>? brands;
  List<CarBrandResponse>? searchList;

  AddBrandsBloc() : super(AddBrandsInitial()) {
    on<GetBrands>((event, emit) {
      _getBrands();
    });

    on<GetBrandsLoading>((event, emit) {
      emit.call(GetBrandsLoadingState());
    });

    on<GetBrandsSuccess>((event, emit) {
      emit.call(GetBrandsSuccessState());
    });

    on<GetBrandsError>((event, emit) {
      emit.call(GetBrandsErrorState());
    });

    on<GetBrandsFailure>((event, emit) {
      emit.call(GetBrandsFailureState());
    });

    on<GetModels>((event, emit) {
      _getModels(brandId: event.brandId);
    });

    on<GetModelsLoading>((event, emit) {
      emit.call(GetModelsLoadingState());
    });

    on<GetModelsSuccess>((event, emit) {
      emit.call(GetModelsSuccessState());
    });

    on<GetModelsError>((event, emit) {
      emit.call(GetModelsErrorState());
    });

    on<GetModelsFailure>((event, emit) {
      emit.call(GetModelsFailureState());
    });

    on<Search>((event, emit) {
      _search(event.input);
    });

    on<SearchSuccess>((event, emit) {
      emit.call(SearchSuccessState());
    });

    on<SearchForModel>((event, emit) {
      _searchForModel(event);
    });

    on<SearchForModelSuccess>((event, emit) {
      emit.call(SearchForModelSuccessState());
    });

    on<SelectUnselectModel>((event, emit) {
      _selectUnselectModel(event);
    });

    on<SelectUnselectModelSuccess>((event, emit) {
      emit.call(SelectUnselectModelSuccessState());
    });

    on<SearchInMyModels>((event, emit) {
      _searchInMyModels(event);
    });

    on<SearchInMyModelsSuccess>((event, emit) {
      emit.call(SearchInMyModelsSuccessState());
    });

    on<AddBrands>((event, emit) {
      _addBrands();
    });

    on<AddBrandsLoading>((event, emit) {
      emit.call(AddBrandsLoadingState());
    });

    on<AddBrandsSuccess>((event, emit) {
      emit.call(AddBrandsSuccessState());
    });

    on<AddBrandsError>((event, emit) {
      addBrandsRequest.sellerCreateBrand = [];
      emit.call(AddBrandsErrorState());
    });

    on<AddBrandsFailure>((event, emit) {
      emit.call(AddBrandsFailureState());
    });
  }

  Future<void> _getBrands() async {
    add(GetBrandsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _getBrandsRepository.getBrands().then((value) async {
          if (value?.isSuccess ?? false) {
            brands = value?.data;
            add(GetBrandsSuccess());
          } else {
            add(GetBrandsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetBrandsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetBrandsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetBrandsFailure());
    }
  }

  Future<void> _getModels({required int brandId}) async {
    add(GetModelsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _getBrandsRepository.getModels(brandId: brandId).then((value) async {
          if (value?.isSuccess ?? false) {
            final item = brands?.firstWhere((element) => element.id == brandId);
            item
              ?..models = value?.data
              ..myModelsSearchList = null
              ..searchList = null;

            add(GetModelsSuccess());
          } else {
            add(GetModelsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetModelsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetModelsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetModelsFailure());
    }
  }

  Future<void> _addBrands() async {
    brands?.forEach((element) {
      if (element.myModels != null && (element.myModels?.isNotEmpty ?? false)) {
        addBrandsRequest.sellerCreateBrand ??= [];
        final List<int> selectedModels = [];
        element.myModels?.forEach((selectedModel) {
          selectedModels.add(selectedModel.id ?? 0);
        });
        addBrandsRequest.sellerCreateBrand?.add(
          AddBrandRequest(
            brandId: element.id,
            sellerCarModels:
                selectedModels.map((e) => BrandModel(carModelId: e)).toList(),
          ),
        );
      }
    });
    if (addBrandsRequest.sellerCreateBrand == null ||
        (addBrandsRequest.sellerCreateBrand?.isEmpty ?? false)) {
      return;
    }

    add(AddBrandsLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _getBrandsRepository
            .addBrands(addBrandsRequest: addBrandsRequest)
            .then((value) async {
          if (value?.isSuccess ?? false) {
            add(AddBrandsSuccess());
          } else {
            add(AddBrandsError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(AddBrandsError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(AddBrandsError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(AddBrandsFailure());
    }
  }

  void _search(String input) {
    searchList = [];
    if (input.isEmpty) {
      searchList = null;
      add(SearchSuccess());
      return;
    }
    brands?.forEach((element) {
      if ((element.nameEn?.toLowerCase().contains(input.toLowerCase()) ??
              false) ||
          input.toLowerCase().contains(element.nameEn?.toLowerCase() ?? '')) {
        searchList?.add(element);
      }
    });
    add(SearchSuccess());
  }

  void _selectUnselectModel(SelectUnselectModel event) {
    final item = brands?.firstWhere((element) => element.id == event.brand.id);
    final model = item?.models?.firstWhere((element) => element.id == event.id);

    item?.models?.firstWhere((element) => element.id == event.id).isSelected =
        !(item.models
                ?.firstWhere((element) => element.id == event.id)
                .isSelected ??
            false);

    if (model?.isSelected ?? false) {
      item?.myModels ??= [];
      item?.myModels?.add(model ?? CarModelResponse());
    } else {
      item?.myModels?.removeWhere((element) => element.id == model?.id);
      if (item?.myModelsSearchList != null &&
          (item?.myModelsSearchList?.isNotEmpty ?? false)) {
        try {
          item?.myModelsSearchList
              ?.removeWhere((element) => element.id == model?.id);
        } catch (e) {
          print(e.toString());
        }
      }
    }
    add(SelectUnselectModelSuccess());
  }

  void _searchForModel(SearchForModel event) {
    event.brand.searchList = [];
    if (event.input.isEmpty) {
      event.brand.searchList = null;
      add(SearchForModelSuccess());
      return;
    }
    event.brand.models?.forEach((element) {
      if ((element.nameEn?.toLowerCase().contains(event.input.toLowerCase()) ??
              false) ||
          event.input
              .toLowerCase()
              .contains(element.nameEn?.toLowerCase() ?? '')) {
        event.brand.searchList?.add(element);
      }
    });
    add(SearchForModelSuccess());
  }

  void _searchInMyModels(SearchInMyModels event) {
    event.brand.myModelsSearchList = [];
    if (event.input.isEmpty) {
      event.brand.myModelsSearchList = null;
      add(SearchInMyModelsSuccess());
      return;
    }
    event.brand.myModels?.forEach((element) {
      if ((element.nameEn?.toLowerCase().contains(event.input.toLowerCase()) ??
              false) ||
          event.input
              .toLowerCase()
              .contains(element.name?.toLowerCase() ?? '')) {
        event.brand.myModelsSearchList?.add(element);
      }
    });
    add(SearchInMyModelsSuccess());
  }
}
