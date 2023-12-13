part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class ChangePassword extends ChangePasswordEvent {}

class ChangePasswordLoading extends ChangePasswordEvent {}

class ChangePasswordSuccess extends ChangePasswordEvent {}

class ChangePasswordError extends ChangePasswordEvent {
  final String? error;

  ChangePasswordError({this.error});
}

class ChangePasswordFailed extends ChangePasswordEvent {}
