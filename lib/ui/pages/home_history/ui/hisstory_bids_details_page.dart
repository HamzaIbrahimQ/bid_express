
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/bids_models/history_bid_model.dart';
import 'package:bid_express/models/data_models/bids_models/won_bid_model.dart';
import 'package:bid_express/models/data_models/profile_model.dart';
import 'package:bid_express/ui/pages/home_history/ui/home_history_page.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/order_at_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/order_was_rated_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/rate_info_profile_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/seller_confirmed_at_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryBidsDetailsPage extends StatefulWidget {
  final BidHistoryModel historyModel;


  const HistoryBidsDetailsPage({super.key, required this.historyModel ,
  });

  @override
  State<HistoryBidsDetailsPage> createState() =>
      _HistoryBidsDetailsPageState();
}

class _HistoryBidsDetailsPageState extends State<HistoryBidsDetailsPage>
    with Utility, UiUtility {


  List<int> starsList = [0, 1, 2, 3, 4];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(
        context: context,
        hasBackIcon: true,
        title: 'Order details',
        titleColor: Colors.white,
        backArrowColor: Colors.white,
        appBarColor: secondaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(
                start: 22.w, end: 16.w, bottom: 16.h),
            width: 1.sw,
            // height: 168.h,
            color: secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'order'.tr() + ' #',
                              style: TextStyle(
                                color: fadeTextColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:

                                  '${widget.historyModel?.orderID ??''}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = () {
                                  //     // navigate to desired screen
                                  //   }
                                )
                              ]),
                        ),
                        4.verticalSpace,
                        Text(
                          createTitleString(widget.historyModel.carParts ),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                        Text(
                          '${widget.historyModel.carName} (${widget.historyModel.carYear})',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${DateFormat('MMM d,yyyy').format(widget.historyModel.timeDate)}' +
                              '  ' +
                              '${DateFormat.jm().format(widget.historyModel.timeDate)}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        8.verticalSpace,
                        Text(
                          ' \$ ${widget.historyModel.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                width: 1.sw,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      40.verticalSpace,
                      Text(
                        widget.historyModel.rateCount
                            .toStringAsFixed(1),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: secondaryColor),
                      ),
                      Container(
                        width: 0.7.sw,
                        height: 36.h,
                        alignment: Alignment.center,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: starsList
                                  .map((e) => Icon(
                                (e + 1 <=
                                    widget
                                        .historyModel.rateCount)
                                    ? Icons.star_rate_rounded
                                    : Icons.star_border_rounded,
                                size: 26.sp,
                                color: const Color(0xFFF5B510),
                              ))
                                  .toList(),
                            )),
                      ),

                      24.verticalSpace,
                      OrderAtWidget(buyerString: 'Adam', carString: widget.historyModel.carName, carYear: widget.historyModel.carYear, deliveryString: 'Amman - Jordan', orderAtDate: widget.historyModel.timeDate),
                      SellerConfirmedAtWidget(isRated: true, timeConfirmed: widget.historyModel.timeDate, locationSeller: 'Amman Jordan', price: widget.historyModel.price, sellerFName: 'User', sellerLName: 'Name'),
                      OrderRatedWidget(isRated: true, timeRated: widget.historyModel.timeDate),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
