import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/home_won_bid_widget.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWonBidsPage extends StatefulWidget {
  const HomeWonBidsPage({Key? key}) : super(key: key);

  @override
  State<HomeWonBidsPage> createState() => _HomeWonBidsPageState();
}

class _HomeWonBidsPageState extends State<HomeWonBidsPage>
    with UiUtility, Utility, TickerProviderStateMixin {
  String dropDownValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Bg image and username
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: DropDownMainWidget(
              hint: 'Date Range',
              functionOnTap: (e) {
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

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: tData.homeWonBids
                    .map((e) => BidWonWidget(wonBidModel: e))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
