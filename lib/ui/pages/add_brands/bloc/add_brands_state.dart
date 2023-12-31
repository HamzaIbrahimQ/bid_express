part of 'add_brands_bloc.dart';

@immutable
abstract class AddBrandsState {}

class AddBrandsInitial extends AddBrandsState {}

class GetBrandsLoadingState extends AddBrandsState {}

class GetBrandsSuccessState extends AddBrandsState {}

class GetBrandsErrorState extends AddBrandsState {
  final String? error;

  GetBrandsErrorState({this.error});
}

class GetBrandsFailureState extends AddBrandsState {}

class GetModelsLoadingState extends AddBrandsState {}

class GetModelsSuccessState extends AddBrandsState {}

class GetModelsErrorState extends AddBrandsState {
  final String? error;

  GetModelsErrorState({this.error});
}

class GetModelsFailureState extends AddBrandsState {}

class SearchSuccessState extends AddBrandsState {}

class SearchForModelSuccessState extends AddBrandsState {}

class SelectUnselectModelSuccessState extends AddBrandsState {}

class SearchInMyModelsSuccessState extends AddBrandsState {}

class AddBrandsLoadingState extends AddBrandsState {}

class AddBrandsSuccessState extends AddBrandsState {}

class AddBrandsErrorState extends AddBrandsState {
  final String? error;

  AddBrandsErrorState({this.error});
}

class AddBrandsFailureState extends AddBrandsState {}
