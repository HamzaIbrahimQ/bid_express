part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class GetInitValuesSuccessState extends SplashState {
  final String accessToken;
  final bool isFirstRun;

  GetInitValuesSuccessState(
      {required this.accessToken, required this.isFirstRun});
}
