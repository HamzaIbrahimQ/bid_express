part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {}

class LoginLoadingEvent extends LoginEvent {
  LoginLoadingEvent();
}

class LoginSuccessEvent extends LoginEvent {}

class LoginErrorEvent extends LoginEvent {
  final String? error;

  LoginErrorEvent({
    this.error,
  });
}

class LoginFailureEvent extends LoginEvent {}
