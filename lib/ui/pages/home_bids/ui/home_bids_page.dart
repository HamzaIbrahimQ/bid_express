import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/home_bids/ui/widgets/bid_widget.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/include_ignored_parts.dart';

class HomeBidsPage extends StatefulWidget {
  const HomeBidsPage({Key? key}) : super(key: key);

  @override
  State<HomeBidsPage> createState() => _HomeBidsPageState();
}

class _HomeBidsPageState extends State<HomeBidsPage>
    with UiUtility, Utility, TickerProviderStateMixin {
  String dropDownValue = '';
  bool _includeIgnoredParts = false;

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

        /// Bids list
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 6.h),
            itemCount: tData.homeBids.length,
            itemBuilder: (context, index) {
              return BidWidget(bidModel: tData.homeBids[index]);
            },
          ),
        ),
      ],
    );
  }
}
