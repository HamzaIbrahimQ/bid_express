part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetUserDataLoadingState extends HomeState {}

class GetUserDataSuccessState extends HomeState {}

class GetUserDataErrorState extends HomeState {
  final String? error;

  GetUserDataErrorState({this.error});
}

class GetUserDataFailureState extends HomeState {}
