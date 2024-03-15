import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/home_history/ui/widgets/history_bid_widget.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomBidsHistoryPage extends StatefulWidget {
  const HomBidsHistoryPage({Key? key}) : super(key: key);

  @override
  State<HomBidsHistoryPage> createState() => _HomeBidsPageState();
}

class _HomeBidsPageState extends State<HomBidsHistoryPage>
    with UiUtility, Utility, TickerProviderStateMixin {
  String dropDownValue = '';

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

        /// Dashboard tabs
        24.verticalSpace,

        /// Bids list
        Expanded(
          child: ListView.builder(
            padding: EdgeInsetsDirectional.only(top: 6.h, start: 24.w, end: 24.w),
            itemCount: tData.homeHisytoyrBids.length,
            itemBuilder: (context, index) {
              return BidHistoryWidget(historyOrderModel: tData.homeHisytoyrBids[index]);
            },
          ),
        ),

      ],
    );
  }
}
