part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class UpdateLocationFieldsState extends SignupState {}
