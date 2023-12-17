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

class AddParts extends ManagePartsEvent {
  final int categoryId;

  AddParts({required this.categoryId});
}

class AddPartsLoading extends ManagePartsEvent {}

class AddPartsSuccess extends ManagePartsEvent {}

class AddPartsError extends ManagePartsEvent {
  final String? error;

  AddPartsError({this.error});
}

class AddPartsFailure extends ManagePartsEvent {}

class SelectUnselectPart extends ManagePartsEvent {
  final int partId;

  SelectUnselectPart({required this.partId});
}

class SelectUnselectPartSuccess extends ManagePartsEvent {}
