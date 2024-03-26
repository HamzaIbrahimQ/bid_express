import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/generated/assets.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


class SuccessPage extends StatelessWidget with UiUtility {
  final String title;
  final String message;
  final Function onContinue;

  const SuccessPage({
    super.key,
    required this.title,
    required this.message,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: title),
      body: Padding(
        padding:
            EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 64.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Lottie
            Lottie.asset(
              Assets.lottiesOrderSent,
              height: 400.h,
              width: 1.sw,
              fit: BoxFit.contain,
              repeat: false,
            ),

            16.verticalSpace,

            /// Msg
            AutoSizeText(
              message,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: MainButton(
          title: 'Done',
          onTap: () => onContinue(),
        ),
      ),
    );
  }
}
