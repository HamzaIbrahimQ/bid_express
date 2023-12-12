import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/ui/pages/add_brands/test_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_brands_event.dart';

part 'add_brands_state.dart';

class AddBrandsBloc extends Bloc<AddBrandsEvent, AddBrandsState> {
  List<Brand>? searchList;

  final List<Brand> data = testBrands + testBrands + testBrands;

  AddBrandsBloc() : super(AddBrandsInitial()) {
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
  }

  void _search(String input) {
    searchList = [];
    if (input.isEmpty) {
      searchList = null;
      add(SearchSuccess());
      return;
    }
    data.forEach((element) {
      if (element.name.toLowerCase().contains(input.toLowerCase()) ||
          input.toLowerCase().contains(element.name.toLowerCase())) {
        searchList?.add(element);
      }
    });
    add(SearchSuccess());
  }

  void _selectUnselectModel(SelectUnselectModel event) {
    final item = data.firstWhere((element) => element.id == event.brand.id);

    item.models[event.index].isSelected =
        !(item.models[event.index].isSelected ?? false);

    if (item.models[event.index].isSelected ?? false) {
      item.myModels ??= [];
      item.myModels?.add(item.models[event.index]);
    } else {
      item.myModels
          ?.removeWhere((element) => element.id == item.models[event.index].id);
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
    event.brand.models.forEach((element) {
      if (element.name.toLowerCase().contains(event.input.toLowerCase()) ||
          event.input.toLowerCase().contains(element.name.toLowerCase())) {
        event.brand.searchList?.add(element);
      }
    });
    add(SearchForModelSuccess());
  }
}
