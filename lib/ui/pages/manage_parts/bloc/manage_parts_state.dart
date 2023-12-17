part of 'manage_parts_bloc.dart';

@immutable
abstract class ManagePartsState {}

class ManagePartsInitial extends ManagePartsState {}

class GetPartsLoadingState extends ManagePartsState {}

class GetPartsSuccessState extends ManagePartsState {}

class GetPartsErrorState extends ManagePartsState {
  final String? error;

  GetPartsErrorState({this.error});
}

class GetPartsFailureState extends ManagePartsState {}


class GetSelectedPartsLoadingState extends ManagePartsState {}

class GetSelectedPartsSuccessState extends ManagePartsState {}

class GetSelectedPartsErrorState extends ManagePartsState {
  final String? error;

  GetSelectedPartsErrorState({this.error});
}

class GetSelectedPartsFailureState extends ManagePartsState {}
