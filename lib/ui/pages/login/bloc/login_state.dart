part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class LoginSuccessState extends LoginState {

}

class LoginErrorState extends LoginState {
  final String? error;

  LoginErrorState({
    this.error,
  });
}

class LoginFailureState extends LoginState {}

