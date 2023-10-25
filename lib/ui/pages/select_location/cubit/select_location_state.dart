part of 'select_location_cubit.dart';

@immutable
abstract class SelectLocationState {}

class SelectLocationInitial extends SelectLocationState {}

class SelectLocationSuccessState extends SelectLocationState {}

class SelectLocationErrorState extends SelectLocationState {}

class GetCurrentLocationSuccessState extends SelectLocationState {}

class GetCurrentLocationErrorState extends SelectLocationState {
  final bool? isService;

  GetCurrentLocationErrorState({this.isService});
}
