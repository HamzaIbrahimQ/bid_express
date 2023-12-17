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

class AddPartsLoadingState extends ManagePartsState {}

class AddPartsSuccessState extends ManagePartsState {}

class AddPartsErrorState extends ManagePartsState {
  final String? error;

  AddPartsErrorState({this.error});
}

class AddPartsFailureState extends ManagePartsState {}

class SelectUnselectPartSuccessState extends ManagePartsState {}
