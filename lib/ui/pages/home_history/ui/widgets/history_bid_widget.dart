import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/bids_models/history_bid_model.dart';
import 'package:bid_express/ui/pages/home_history/ui/hisstory_bids_details_page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidHistoryWidget extends StatefulWidget {
  final BidHistoryModel historyOrderModel;

  const BidHistoryWidget({super.key, required this.historyOrderModel});

  @override
  State<BidHistoryWidget> createState() => _BidHistoryWidgetState();
}

class _BidHistoryWidgetState extends State<BidHistoryWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          _navigateToHistoryDetailsPage(context, widget.historyOrderModel),
      borderRadius: BorderRadius.circular(6.r),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        width: 325.w,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 14.w,
          top: 6.h,
          bottom: 13.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.01),
              spreadRadius: .1,
              blurRadius: 5,
            ),
            BoxShadow(
              offset: const Offset(0, 7),
              color: Colors.black.withOpacity(0.01),
              spreadRadius: 5,
              blurRadius: 5,
            ),
            BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.black.withOpacity(0.05),
              spreadRadius: .1,
              blurRadius: 5,
            ),
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.black.withOpacity(0.05),
              spreadRadius: .1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                    12.verticalSpace,
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
                              text: '${widget.historyOrderModel.orderID}',
                              style: TextStyle(
                                  color: blackColor,
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
                    6.verticalSpace,
                  ] +
                  (widget.historyOrderModel.carParts
                      .map(
                        (e) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              e,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: blackColor),
                            ),
                            2.verticalSpace
                          ],
                        ),
                      )
                      .toList()) +
                  <Widget>[
                    Text(
                      '${widget.historyOrderModel.carName} ${widget.historyOrderModel.carYear}',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                  ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                12.verticalSpace,
                Container(
                  width: .4.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${DateFormat('MMM d,yyyy').format(widget.historyOrderModel.timeDate)}' +
                            '  ' +
                            '${DateFormat.jm().format(widget.historyOrderModel.timeDate)}',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                (8* widget.historyOrderModel.carParts.length).verticalSpace,
                Text(
                  ' \$ ${widget.historyOrderModel.price.toStringAsFixed(0)}',
                  style: TextStyle(
                      color: const Color(0xFF2D3D5E),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                      createStarsRate(widget.historyOrderModel.rateCount) +
                          [
                            Text(
                              ' ${widget.historyOrderModel.rateCount} ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF2D3D5E),
                                  fontFamily: 'Montserrat'),
                            )
                          ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _navigateToHistoryDetailsPage(
      BuildContext context, BidHistoryModel historyOrderModel) {
    navigate(
      context: context,
      page: HistoryBidsDetailsPage(historyModel: historyOrderModel),
    );
  }
}
