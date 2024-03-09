import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/home_bids/ui/widgets/bid_widget.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBidsPage extends StatefulWidget {
  const HomeBidsPage({Key? key}) : super(key: key);

  @override
  State<HomeBidsPage> createState() => _HomeBidsPageState();
}

class _HomeBidsPageState extends State<HomeBidsPage>
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
            padding:  EdgeInsets.symmetric(
              horizontal: 24.w
            ),
            child: DropDownMainWidget(functionOnTap: (e){
              setState(() {
                dropDownValue = e;
              });
            }, valueSelected: dropDownValue ,
              options: tData.rangeDataList,),
          ),
          /// Dashboard tabs
          24.verticalSpace,

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: tData.homeBids.map((e) =>
                BidWidget(bidModel: e)).toList(),
              ),
            ),
          ),
        ],
      ),
    ) ;
  }


}
