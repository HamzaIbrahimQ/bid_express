import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/ui/pages/make_bid/ui/make_bid-page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as time_ago;

class SubmittedBidWidget extends StatefulWidget {
  final BidModel bidModel;

  const SubmittedBidWidget({super.key, required this.bidModel});

  @override
  State<SubmittedBidWidget> createState() => _SubmittedBidWidgetState();
}

class _SubmittedBidWidgetState extends State<SubmittedBidWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToBidPage(context, widget.bidModel),
      borderRadius: BorderRadius.circular(6.r),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        margin:
            EdgeInsetsDirectional.only(bottom: 16.h, end: 24.w, start: 24.w),
        padding: EdgeInsetsDirectional.only(
          start: 8.w,
          end: 6.w,
          top: 10.h,
          bottom: 8.h,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Order id and time ago
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Order id
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
                          text: '${widget.bidModel.orderID}',
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

                /// Time ago
                Text(
                  time_ago.format(widget.bidModel.creationDate),
                  style: TextStyle(
                    color: fadeTextColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),

            6.verticalSpace,

            /// Bid content
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Brand image
                SvgPicture.asset(
                  'assets/icons/toyota.svg',
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),

                12.horizontalSpace,

                /// Parts and car info and ignore
                Expanded(
                  child: Row(
                    children: [
                      /// Parts and car info
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:

                                /// Parts
                                widget.bidModel.carParts
                                    .map(
                                      (e) => Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 2.h),
                                        child: Text(
                                          e ?? '',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: blackColor),
                                        ),
                                      ),
                                    )
                                    .toList()),
                      ),

                    ],
                  ),
                ),
              ],
            ),

            6.verticalSpace,
            /// Car info
            Text(
              '${widget.bidModel.carName} (${widget.bidModel.carYear})',
              maxLines: 2,
              style: TextStyle(
                color: fadeTextColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              ),
            ),


          ],
        ),
      ),
    );
  }

  void _navigateToBidPage(BuildContext context, BidModel bidModel) {
    navigate(
        context: context,
        page: MakeBidPage(
          bidModel: bidModel,
        ),
        duration: const Duration(milliseconds: 300));
  }
}
