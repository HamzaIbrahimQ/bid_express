import 'package:bid_express/ui/pages/home_bids/ui/widgets/bid_widget.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/submitted_bid_widget.dart';


class SubmittedBidsPage extends StatefulWidget {
  const SubmittedBidsPage({Key? key}) : super(key: key);

  @override
  State<SubmittedBidsPage> createState() => _SubmittedBidsPageState();
}

class _SubmittedBidsPageState extends State<SubmittedBidsPage>
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
              onTap: (e) {
                setState(() {
                  dropDownValue = e;
                });
              },
              valueSelected: dropDownValue,
              options: tData.rangeDataList,
            ),
          ),

          16.verticalSpace,

          /// Bids list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 6.h),
              itemCount: tData.homeBids.length,
              itemBuilder: (context, index) {
                return SubmittedBidWidget(bidModel: tData.homeBids[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
