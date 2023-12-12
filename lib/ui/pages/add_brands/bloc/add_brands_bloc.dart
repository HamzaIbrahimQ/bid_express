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
}
