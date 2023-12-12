part of 'add_brands_bloc.dart';

@immutable
abstract class AddBrandsState {}

class AddBrandsInitial extends AddBrandsState {}

class SearchSuccessState extends AddBrandsState {}

class SearchForModelSuccessState extends AddBrandsState {}

class SelectUnselectModelSuccessState extends AddBrandsState {}

class SearchInMyModelsSuccessState extends AddBrandsState {}
