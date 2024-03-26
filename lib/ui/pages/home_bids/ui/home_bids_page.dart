import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/home_bids/ui/widgets/bid_widget.dart';
import 'package:bid_express/ui/widgets/custom_tooltip.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

import 'widgets/include_ignored_parts.dart';

class HomeBidsPage extends StatefulWidget {
  const HomeBidsPage({Key? key}) : super(key: key);

  @override
  State<HomeBidsPage> createState() => _HomeBidsPageState();
}

class _HomeBidsPageState extends State<HomeBidsPage>
    with UiUtility, Utility, TickerProviderStateMixin {
  String dropDownValue = '';

  // bool _includeIgnoredParts = false;
  final List<BidModel> orders = [];

  @override
  void initState() {
    super.initState();
    orders.addAll(tData.homeBids);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Bg image and username
        24.verticalSpace,
        Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w, end: 20.w),
          child: Row(
            children: [
              /// Date range
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 6.w),
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
              ),

              /// include ignored switch
              // StatefulBuilder(
              //   builder: (context, setState) {
              //     return Switch(
              //       activeColor: primaryColor,
              //       inactiveTrackColor: Colors.grey[200],
              //       value: _includeIgnoredParts,
              //       onChanged: (v) => setState(() => _includeIgnoredParts = v),
              //     );
              //   }
              // ),
            ],
          ),
        ),

        16.verticalSpace,

        // StatefulBuilder(
        //   builder: (context, setState) {
        //     return IncludeIgnoredParts(
        //       title: 'Include ignored parts',
        //       value: _includeIgnoredParts,
        //       onChanged: (v) => setState(() => _includeIgnoredParts = v),
        //     );
        //   },
        // ),
        //
        // 4.verticalSpace,

        /// Bids list
        Expanded(
          child: RefreshIndicator(
            color: primaryColor,
            onRefresh: () async {
              setState(() {
                orders.clear();
                orders.addAll(tData.homeBids);
              });
            },
            child: OverlayTooltipItem(
              displayIndex: 5,
              tooltipVerticalPosition: TooltipVerticalPosition.TOP,
              tooltip: (controller) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                  ),
                  child: CustomTooltip(
                    title:
                    'Let\'s discover orders now and press on any order to make your first bid!',
                    controller: controller,
                  ),
                );
              },
              child: ListView.builder(
                padding: EdgeInsets.only(top: 6.h),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return BidWidget(
                      bidModel: orders[index],
                      index: index,
                      onIgnored: () {
                        setState(
                          () {
                            orders.removeWhere((element) =>
                                element.orderID == orders[index].orderID);
                          },
                        );
                      });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
