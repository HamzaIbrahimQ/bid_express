import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/generated/assets.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class GuidePage extends StatelessWidget with UiUtility {
  final String appBarTitle;
  final String title;
  final String msg;
  final String buttonTitle;
  final Function onContinue;

  const GuidePage({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.msg,
    required this.buttonTitle,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: appBarTitle),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Lottie
            Lottie.asset(
              Assets.lottiesGuide,
              height: 300.h,
              width: 1.sw,
              fit: BoxFit.contain,
            ),

            32.verticalSpace,

            /// Add car title
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            12.verticalSpace,

            /// Add car description
            AutoSizeText(
              msg,
              maxLines: 8,
              minFontSize: 9,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            12.verticalSpace,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: MainButton(
          title: buttonTitle,
          onTap: () => onContinue(),
        ),
      ),
    );
  }
}
