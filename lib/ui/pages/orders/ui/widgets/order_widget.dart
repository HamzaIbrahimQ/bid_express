import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/models/responses/orders/get_orders_response.dart';
import 'package:bid_express/ui/pages/make_bid/ui/make_bid-page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as time_ago;

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToBidPage(context, widget.order),
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
                    children: [
                      TextSpan(
                        text: '${widget.order.id}',
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
                    ],
                  ),
                ),

                /// Time ago
                Text(
                  // time_ago.format(widget.order.creationDate),
                  time_ago.format(
                    DateTime.now().subtract(
                      const Duration(minutes: 20),
                    ),
                  ),
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
                              widget.order.partsNameEn
                                      ?.map(
                                        (part) => Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              bottom: 2.h),
                                          child: Text(
                                            part ?? '',
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: blackColor),
                                          ),
                                        ),
                                      )
                                      .toList() ??
                                  [],
                        ),
                      ),

                      /// Ignore
                      IconButton(
                        padding: EdgeInsets.zero,
                        tooltip: 'Hide this part from the list',
                        style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        icon: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Icon
                            SvgPicture.asset(
                              'assets/icons/ignore.svg',
                              fit: BoxFit.cover,
                            ),

                            6.verticalSpace,

                            /// Label
                            Text(
                              'Ignore this part',
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),

            6.verticalSpace,

            /// Car info
            Text(
              // '${widget.order.carBrand} (${widget.order.carYear})',
              '${widget.order.carBrand} (2005})',
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

  void _navigateToBidPage(BuildContext context, Order order) {
    navigate(
        context: context,
        page: MakeBidPage(order: order),
        duration: const Duration(milliseconds: 300));
  }
}
