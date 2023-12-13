part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {
  final String? error;

  ChangePasswordErrorState({this.error});
}

class ChangePasswordFailedState extends ChangePasswordState {}
