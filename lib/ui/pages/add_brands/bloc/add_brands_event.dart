part of 'add_brands_bloc.dart';

@immutable
abstract class AddBrandsEvent {}

class Search extends AddBrandsEvent {
  final String input;

  Search({required this.input});
}

class SearchSuccess extends AddBrandsEvent {}
