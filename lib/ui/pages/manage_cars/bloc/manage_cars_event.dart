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
