part of 'manage_cars_bloc.dart';

@immutable
abstract class ManageCarsEvent {}

class GetCars extends ManageCarsEvent {}

class GetCarsLoading extends ManageCarsEvent {}

class GetCarsSuccess extends ManageCarsEvent {}

class GetCarsError extends ManageCarsEvent {
  final String? error;

  GetCarsError({this.error});
}

class GetCarsFailure extends ManageCarsEvent {}

class SelectBrand extends ManageCarsEvent {
  final int brandId;

  SelectBrand({required this.brandId});
}

class UpdateSelectedBrand extends ManageCarsEvent {}

class SelectModel extends ManageCarsEvent {
  final int modelId;

  SelectModel({required this.modelId});
}

class UpdateSelectedModel extends ManageCarsEvent {
  final int modelId;

  UpdateSelectedModel({required this.modelId});
}

class GetCategories extends ManageCarsEvent {}

class GetCategoriesLoading extends ManageCarsEvent {}

class GetCategoriesSuccess extends ManageCarsEvent {}

class GetCategoriesError extends ManageCarsEvent {
  final String? error;

  GetCategoriesError({this.error});
}

class GetCategoriesFailure extends ManageCarsEvent {}

class GetSelectedCategories extends ManageCarsEvent {
  final int modelId;

  GetSelectedCategories({required this.modelId});
}

class GetSelectedCategoriesLoading extends ManageCarsEvent {}

class GetSelectedCategoriesSuccess extends ManageCarsEvent {}

class GetSelectedCategoriesError extends ManageCarsEvent {
  final String? error;

  GetSelectedCategoriesError({this.error});
}

class GetSelectedCategoriesFailure extends ManageCarsEvent {}
