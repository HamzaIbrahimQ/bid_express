
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/ui/pages/make_bid/ui/make_bid-page.dart';
import 'package:bid_express/ui/widgets/popup_menu_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidWidget extends StatefulWidget {
  final BidModel bidModel;

  const BidWidget({super.key, required this.bidModel});

  @override
  State<BidWidget> createState() => _BidWidgetState();
}

class _BidWidgetState extends State<BidWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToBidPage(context, widget.bidModel),
      borderRadius: BorderRadius.circular(6.r),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        width: 325.w,
        margin: EdgeInsets.only(bottom: 16.h  ,
        right: 24.w , left: 24.w
        ),
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 14.w,
          top: 6.h,
          bottom: 13.h,
        ),
        decoration: BoxDecoration(
          color:
         Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                6.verticalSpace,
              ] +
                  (widget.bidModel.carParts
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
                      .toList() ??
                      []) +
                  <Widget>[
                    Text(
                      '${widget.bidModel.carName} (${widget.bidModel.carYear})',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                  ],
            ),
            Container(
              width: 24.w,
              child: PopupMenuWidget(
                firstActionTitle: 'ignore'.tr(),
                secondActionTitle: 'delete'.tr(),
                  firstAction: (){
                    showAnimatedDialog(
                        context: context,
                        animationType: DialogTransitionType.slideFromTop,
                        duration: const Duration(milliseconds: 250),
                        builder: (context) {
                          return Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 1.sw,
                                  height: .25.sh,
                                  color: Colors.white,
                                  padding:
                                  EdgeInsetsDirectional.symmetric(
                                    vertical: 28.h,
                                    horizontal: 24.w,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'confirmation'.tr(),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: secondaryColor),
                                        maxLines: 2,
                                      ),
                                      8.verticalSpace,
                                      Text(
                                        'Do you want really to ignore this part?',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.normal,
                                            color: secondaryColor),
                                        maxLines: 2,
                                      ),
                                      28.verticalSpace,
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: MainButton(
                                                title: 'no'.tr(),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            10.horizontalSpace,
                                            Flexible(
                                              child: MainButton(
                                                  title: 'yes'.tr(),
                                                  onTap:(){
                                                    Navigator.pop(context);

                                                  }
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          );
                        });
                  },

                secondAction: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _navigateToBidPage(
      BuildContext context, BidModel bidModel) {
    navigate(
        context: context,
        page:  MakeBidPage(bidModel: bidModel,),
        duration: const Duration(milliseconds: 300));
  }


}
