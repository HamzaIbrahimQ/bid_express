part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}

class GetOrders extends OrdersEvent {}

class GetOrdersLoading extends OrdersEvent {}

class GetOrdersSuccess extends OrdersEvent {}

class GetOrdersError extends OrdersEvent {
  final String? error;

  GetOrdersError({this.error});
}

class GetOrdersFailure extends OrdersEvent {}
