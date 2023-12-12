part of 'add_brands_bloc.dart';

@immutable
abstract class AddBrandsEvent {}

class Search extends AddBrandsEvent {
  final String input;

  Search({required this.input});
}

class SearchSuccess extends AddBrandsEvent {}

class SearchForModel extends AddBrandsEvent {
  final Brand brand;
  final String input;

  SearchForModel({required this.brand, required this.input});
}

class SearchForModelSuccess extends AddBrandsEvent {}

class SelectUnselectModel extends AddBrandsEvent {
  final Brand brand;
  final int id;

  SelectUnselectModel({required this.brand, required this.id});
}

class SelectUnselectModelSuccess extends AddBrandsEvent {}

class SearchInMyModels extends AddBrandsEvent {
  final Brand brand;
  final String input;

  SearchInMyModels({required this.brand, required this.input});
}

class SearchInMyModelsSuccess extends AddBrandsEvent {}
