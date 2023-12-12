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
  final int index;

  SelectUnselectModel({required this.brand, required this.index});
}

class SelectUnselectModelSuccess extends AddBrandsEvent {}
