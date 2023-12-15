part of 'add_brands_bloc.dart';

@immutable
abstract class AddBrandsEvent {}

class GetBrands extends AddBrandsEvent {}

class GetBrandsLoading extends AddBrandsEvent {}

class GetBrandsSuccess extends AddBrandsEvent {}

class GetBrandsError extends AddBrandsEvent {
  final String? error;

  GetBrandsError({this.error});
}

class GetBrandsFailure extends AddBrandsEvent {}

class GetModels extends AddBrandsEvent {
  final int brandId;

  GetModels({required this.brandId});
}

class GetModelsLoading extends AddBrandsEvent {}

class GetModelsSuccess extends AddBrandsEvent {}

class GetModelsError extends AddBrandsEvent {
  final String? error;

  GetModelsError({this.error});
}

class GetModelsFailure extends AddBrandsEvent {}

class Search extends AddBrandsEvent {
  final String input;

  Search({required this.input});
}

class SearchSuccess extends AddBrandsEvent {}

class SearchForModel extends AddBrandsEvent {
  final CarBrandResponse brand;
  final String input;

  SearchForModel({required this.brand, required this.input});
}

class SearchForModelSuccess extends AddBrandsEvent {}

class SelectUnselectModel extends AddBrandsEvent {
  final CarBrandResponse brand;
  final int id;

  SelectUnselectModel({required this.brand, required this.id});
}

class SelectUnselectModelSuccess extends AddBrandsEvent {}

class SearchInMyModels extends AddBrandsEvent {
  final CarBrandResponse brand;
  final String input;

  SearchInMyModels({required this.brand, required this.input});
}

class SearchInMyModelsSuccess extends AddBrandsEvent {}
