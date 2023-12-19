import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerDecisionPage extends StatelessWidget with UiUtility {
  const SellerDecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBgColor,
      // appBar: getAppBar(
      //     context: context, title: 'Seller decision', titleColor: Colors.white),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Stack(
              fit: StackFit.expand,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Logo
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w, top: 120.h),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset('assets/imgs/logo.svg'),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 60.h,
                          start: 72.w,
                          end: 8.w,
                          bottom: 8.h,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: AutoSizeText(
                            'CARPARTS',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5,
                              height: 1.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Buttons
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 164.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Approve button
                      MainButton(
                        title: 'Seller Approve',
                        onTap: () {},
                      ),

                      16.verticalSpace,

                      /// Reject button
                      MainButton(
                        title: 'Seller Reject',
                        color: redColor,
                        onTap: () {},
                      ),

                      16.verticalSpace,

                      /// Close app button
                      MainButton(
                        title: 'Close app',
                        color: greyColor,
                        onTap: () => SystemNavigator.pop(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
