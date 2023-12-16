part of 'manage_cars_bloc.dart';

@immutable
abstract class ManageCarsState {}

class ManageCarsInitial extends ManageCarsState {}

class GetCarsLoadingState extends ManageCarsState {}

class GetCarsSuccessState extends ManageCarsState {}

class GetCarsErrorState extends ManageCarsState {
  final String? error;

  GetCarsErrorState({this.error});
}

class GetCarsFailureState extends ManageCarsState {}

class UpdateSelectedBrandState extends ManageCarsState {}

class UpdateSelectedModelState extends ManageCarsState {
  final int modelId;

  UpdateSelectedModelState({required this.modelId});
}

class GetCategoriesLoadingState extends ManageCarsState {}

class GetCategoriesSuccessState extends ManageCarsState {}

class GetCategoriesErrorState extends ManageCarsState {
  final String? error;

  GetCategoriesErrorState({this.error});
}

class GetCategoriesFailureState extends ManageCarsState {}

class GetSelectedCategoriesLoadingState extends ManageCarsState {}

class GetSelectedCategoriesSuccessState extends ManageCarsState {}

class GetSelectedCategoriesErrorState extends ManageCarsState {
  final String? error;

  GetSelectedCategoriesErrorState({this.error});
}

class GetSelectedCategoriesFailureState extends ManageCarsState {}
