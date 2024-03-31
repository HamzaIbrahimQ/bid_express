import 'package:bid_express/components/colors.dart';
import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/ui/pages/guide_page/ui/guide_page.dart';
import 'package:bid_express/ui/pages/make_bid/ui/make_bid-page.dart';
import 'package:bid_express/ui/widgets/custom_tooltip.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:timeago/timeago.dart' as time_ago;

class SuborderWidget extends StatefulWidget {
  final SubBidModel subBidModel;

  const SuborderWidget({super.key, required this.subBidModel});

  @override
  State<SuborderWidget> createState() => _SuborderWidgetState();
}

class _SuborderWidgetState extends State<SuborderWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToBidPage(context, widget.subBidModel),
      borderRadius: BorderRadius.circular(6.r),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        margin: EdgeInsetsDirectional.only(
          bottom: 6.h,
          end: 6.w,
          start: 6.w,
        ),
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
              spreadRadius: .1,
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
                          text: '${widget.subBidModel.orderID}',
                          style: TextStyle(
                            color: fadeTextColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // navigate to desired screen
                          //   }
                        )
                      ]),
                ),

                /// Time ago
                Text(
                  differenceInDays(widget.subBidModel.creationDate) == 0
                      ? time_ago.format(widget.subBidModel.creationDate)
                      : differenceInDays(widget.subBidModel.creationDate) == 1
                          ? 'Yesterday'
                          : '${DateFormat('MMM d,yyyy').format(widget.subBidModel.creationDate)}' +
                              '  ' +
                              '${DateFormat.jm().format(widget.subBidModel.creationDate)}',
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
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 2.h),
                              child: Text(
                                widget.subBidModel.part,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: blackColor),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Ignore

                      // IconButton(
                      //   padding: EdgeInsets.zero,
                      //   tooltip: 'Hide this part from the list',
                      //   style: const ButtonStyle(
                      //       overlayColor:
                      //           MaterialStatePropertyAll(Colors.transparent)),
                      //   icon: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       /// Icon
                      //       if (widget.index == 0)
                      //         OverlayTooltipItem(
                      //           displayIndex: 4,
                      //           tooltip: (controller) {
                      //             return Padding(
                      //               padding: EdgeInsetsDirectional.only(
                      //                 start: 16.w,
                      //               ),
                      //               child: CustomTooltip(
                      //                 title:
                      //                     'If you are not interested with this order, you can press here to hide it.',
                      //                 controller: controller,
                      //               ),
                      //             );
                      //           },
                      //           child: SvgPicture.asset(
                      //             'assets/icons/ignore.svg',
                      //             fit: BoxFit.cover,
                      //           ),
                      //         )
                      //       else
                      //         SvgPicture.asset(
                      //           'assets/icons/ignore.svg',
                      //           fit: BoxFit.cover,
                      //         ),
                      //
                      //       6.verticalSpace,
                      //
                      //       /// Label
                      //       Text(
                      //         'Not interested',
                      //         style: TextStyle(
                      //           fontSize: 9.sp,
                      //           color: secondaryColor,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   onPressed: widget.onIgnored,
                      // )
                    ],
                  ),
                ),
              ],
            ),

            6.verticalSpace,

            /// Car info
            Text(
              '${widget.subBidModel.carName} (${widget.subBidModel.carYear})',
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

  Future<void> _navigateToBidPage(BuildContext context, SubBidModel orderModel) async {
    final SharedPreferenceHelper _sharedPreferenceHelper =
    SharedPreferenceHelper();
    final bool? _isFirstOrder =
        await _sharedPreferenceHelper.getBooleanValue(key: 'isFirstOrder');
    if (_isFirstOrder ?? true) {
      navigate(
        context: context,
        page: GuidePage(
          appBarTitle: 'Make bid',
          title: 'Your first bid',
          msg: 'This message to tell the user more about making his first bid,'
              'This message to tell the user more about making his first bid.',
          buttonTitle: 'Let\'s make a bid',
          onContinue: () {
            navigate(
              context: context,
              isReplacement: true,
              page: MakeBidPage(
                orderModel: OrderModel(
                  orderID: widget.subBidModel.orderID,
                  carName: widget.subBidModel.carName,
                  carYear: widget.subBidModel.carYear,
                  creationDate: widget.subBidModel.creationDate,
                  subOrders: [
                    SubBidModel(
                        orderID: widget.subBidModel.orderID,
                        carName: widget.subBidModel.carName,
                        carYear: widget.subBidModel.carYear,
                        creationDate: widget.subBidModel.creationDate,
                        part: orderModel.part),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      await _sharedPreferenceHelper.saveBooleanValue(key: 'isFirstOrder', value: false);
      navigate(
        context: context,
        isReplacement: true,
        page: MakeBidPage(
          orderModel: OrderModel(
            orderID: widget.subBidModel.orderID,
            carName: widget.subBidModel.carName,
            carYear: widget.subBidModel.carYear,
            creationDate: widget.subBidModel.creationDate,
            subOrders: [
              SubBidModel(
                  orderID: widget.subBidModel.orderID,
                  carName: widget.subBidModel.carName,
                  carYear: widget.subBidModel.carYear,
                  creationDate: widget.subBidModel.creationDate,
                  part: orderModel.part),
            ],
          ),
        ),
      );
    }

  }
}
