import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/orders/bloc/orders_bloc.dart';
import 'package:bid_express/ui/pages/orders/ui/widgets/order_widget.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/include_ignored_parts.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with UiUtility, Utility, TickerProviderStateMixin {
  late OrdersBloc _bloc;

  String dropDownValue = '';
  bool _includeIgnoredParts = false;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<OrdersBloc>();
    _bloc.add(GetOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Bg image and username
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: DropDownMainWidget(
            hint: 'Date Range',
            onTap: (e) {
              setState(() {
                dropDownValue = e;
              });
            },
            valueSelected: dropDownValue,
            options: tData.rangeDataList,
          ),
        ),

        8.verticalSpace,

        StatefulBuilder(
          builder: (context, setState) {
            return IncludeIgnoredParts(
              title: 'Include ignored parts',
              value: _includeIgnoredParts,
              onChanged: (v) => setState(() => _includeIgnoredParts = v),
            );
          },
        ),

        4.verticalSpace,

        /// Orders list
        Expanded(
          child: BlocConsumer<OrdersBloc, OrdersState>(
            listener: (context, state) {
              if (state is GetOrdersLoadingState) {
                LoadingView.shared.startLoading(context);
              }
              if (state is GetOrdersSuccessState) {
                LoadingView.shared.stopLoading();
              }
              if (state is GetOrdersErrorState) {
                LoadingView.shared.stopLoading();
                showErrorToast(context: context, msg: state.error);
              }
              if (state is GetOrdersFailureState) {
                LoadingView.shared.stopLoading();
                showErrorToast(context: context);
              }
            },
            builder: (context, state) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 6.h),
                itemCount: _bloc.orders.length,
                itemBuilder: (context, index) {
                  return OrderWidget(order: _bloc.orders[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
