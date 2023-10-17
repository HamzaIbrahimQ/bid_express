part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class GetInitValues extends SplashEvent {}

class GetInitValuesSuccess extends SplashEvent {
  final String accessToken;
  final bool isFirstRun;

  GetInitValuesSuccess({required this.accessToken, required this.isFirstRun});
}
