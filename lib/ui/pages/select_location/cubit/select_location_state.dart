part of 'select_location_cubit.dart';

@immutable
abstract class SelectLocationState {}

class SelectLocationInitial extends SelectLocationState {}

class GetCurrentLocationSuccessState extends SelectLocationState {}

class GetCurrentLocationErrorState extends SelectLocationState {
  final bool? isService;

  GetCurrentLocationErrorState({this.isService});
}

class SelectLocationSuccessState extends SelectLocationState {}

class SelectLocationErrorState extends SelectLocationState {}

class DeleteSelectedLocationState extends SelectLocationState {}

class GetSelectedLocationDataLoadingState extends SelectLocationState {}

class GetSelectedLocationDataSuccessState extends SelectLocationState {}

class GetSelectedLocationDataErrorState extends SelectLocationState {
  final String? error;

  GetSelectedLocationDataErrorState({this.error});
}

class SelectedLocationOutOfRangeState extends SelectLocationState {}
