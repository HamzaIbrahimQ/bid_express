part of 'manage_parts_bloc.dart';

@immutable
abstract class ManagePartsEvent {}

class GetParts extends ManagePartsEvent {
  final int categoryId;

  GetParts({required this.categoryId});
}

class GetPartsLoading extends ManagePartsEvent {}

class GetPartsSuccess extends ManagePartsEvent {}

class GetPartsError extends ManagePartsEvent {
  final String? error;

  GetPartsError({this.error});
}

class GetPartsFailure extends ManagePartsEvent {}


class GetSelectedParts extends ManagePartsEvent {
  final int categoryId;

  GetSelectedParts({required this.categoryId});
}

class GetSelectedPartsLoading extends ManagePartsEvent {}

class GetSelectedPartsSuccess extends ManagePartsEvent {}

class GetSelectedPartsError extends ManagePartsEvent {
  final String? error;

  GetSelectedPartsError({this.error});
}

class GetSelectedPartsFailure extends ManagePartsEvent {}