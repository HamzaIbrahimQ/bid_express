import 'dart:async';

import 'package:bid_express/models/responses/orders/get_orders_response.dart';
import 'package:bid_express/ui/pages/orders/bloc/orders_repo.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> with Utility {
  final OrdersRepository _ordersRepository = OrdersRepository();
  final List<Order> orders = [];
  int pageNumber = 1;
  int ordersDateRangeInDays = 0;

  OrdersBloc() : super(OrdersInitial()) {
    on<GetOrders>((event, emit) {
      _getOrders();
    });

    on<GetOrdersLoading>((event, emit) {
      emit.call(GetOrdersLoadingState());
    });

    on<GetOrdersSuccess>((event, emit) {
      emit.call(GetOrdersSuccessState());
    });

    on<GetOrdersError>((event, emit) {
      emit.call(GetOrdersErrorState(error: event.error));
    });

    on<GetOrdersFailure>((event, emit) {
      emit.call(GetOrdersFailureState());
    });
  }

  Future<void> _getOrders() async {
    add(GetOrdersLoading());
    final bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        // internet connection available
        _ordersRepository
            .getOrders(days: ordersDateRangeInDays, pageNumber: 0)
            .then((value) async {
          if (value?.isSuccess ?? false) {
            orders.addAll(value?.data);
            add(GetOrdersSuccess());
          } else {
            add(GetOrdersError(error: value?.errorMessage));
          }
        }).catchError((e) {
          errorLog(e.toString());
          add(GetOrdersError(error: e.toString()));
        });
      } catch (error) {
        errorLog(error.toString());
        add(GetOrdersError(error: error.toString()));
      }
    } else {
      // no internet connection
      add(GetOrdersFailure());
    }
  }
}
