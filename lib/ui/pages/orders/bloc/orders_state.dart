part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class GetOrdersLoadingState extends OrdersState {}

class GetOrdersSuccessState extends OrdersState {}

class GetOrdersErrorState extends OrdersState {
  final String? error;

  GetOrdersErrorState({this.error});
}

class GetOrdersFailureState extends OrdersState {}
