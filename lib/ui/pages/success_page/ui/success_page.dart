import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/generated/assets.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/colors.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> with UiUtility, Utility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'Bid Submitted',
        hasBackIcon: true,
        onBackPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w, bottom: 64.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.iconsSuccess,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
            16.verticalSpace,
            Text(
              'Your Bid Has been Submitted Successfully!',
        textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: blackColor,
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
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}
