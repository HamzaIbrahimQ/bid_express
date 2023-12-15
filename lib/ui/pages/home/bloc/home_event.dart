part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetUserData extends HomeEvent {}

class GetUserDataLoading extends HomeEvent {}

class GetUserDataSuccess extends HomeEvent {}

class GetUserDataError extends HomeEvent {
  final String? error;

  GetUserDataError({this.error});
}

class GetUserDataFailure extends HomeEvent {}
