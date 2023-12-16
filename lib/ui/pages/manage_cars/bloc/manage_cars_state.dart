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
