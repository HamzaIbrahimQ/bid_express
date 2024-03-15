import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/models/data_models/bids_models/cancelled_bid_model.dart';
import 'package:bid_express/ui/widgets/popup_menu_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BidCancelledWidget extends StatefulWidget {
  final BidCancelledModel bidCancelledModel;

  const BidCancelledWidget({super.key, required this.bidCancelledModel});

  @override
  State<BidCancelledWidget> createState() => _BidCancelledWidgetState();
}

class _BidCancelledWidgetState extends State<BidCancelledWidget>
    with UiUtility {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      text: '${widget.bidCancelledModel.orderID}',
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Text(
                '${DateFormat('MMM d,yyyy').format(widget.bidCancelledModel.timaDate)}' +
                    '  ' +
                    '${DateFormat.jm().format(widget.bidCancelledModel.timaDate)}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10.sp,
                    color: greyColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
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

              10.horizontalSpace,

              /// Parts and reason
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Parts
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.bidCancelledModel.carParts
                          .map(
                            (e) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              e ?? '',
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
                          .toList(),
                    ),

                    /// Reason button
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.w),
                      child: InkWell(

                        child: Container(
                          alignment: Alignment.center,
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6.sp),),
                            color: primaryColor,
                          ),
                          child: Text(
                            'reason'.tr(),
                            style: TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                        ),
                        onTap: () {
                          showAnimatedDialog(
                              context: context,
                              animationType: DialogTransitionType.slideFromBottom,
                              duration: const Duration(milliseconds: 250),
                              builder: (context) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 1.sw,
                                        height: 0.54.sh,
                                        color: Colors.white,
                                        padding: EdgeInsetsDirectional.symmetric(
                                            vertical: 16.h),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 24.w,
                                              ),
                                              child: Text(
                                                'Cancelled',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: blackColor),
                                                maxLines: 2,
                                              ),
                                            ),
                                            20.verticalSpace,
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 24.w,
                                                ),
                                                alignment: Alignment.topCenter,
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: Text(
                                                    widget.bidCancelledModel
                                                        .reasonCancelled,
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat',
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.normal,
                                                        color: secondaryColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            16.verticalSpace,
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 327.w,
                                                height: 56.h,
                                                child: MainButton(
                                                    title: 'close'.tr(),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ],
            ),
          ),
          Text(
            '${widget.bidCancelledModel.carName} ${(widget.bidCancelledModel.carYear)}',
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
    );
  }
}
