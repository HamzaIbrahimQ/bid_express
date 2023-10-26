import 'package:bid_express/components/colors.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget with UiUtility {
   NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Notifications'),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.only(
          start: 24.w,
          end: 24.w,
          top: 8.h,
          bottom: 16.h,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 12.w,
              top: 20.h,
              bottom: 20.h,
            ),
            margin: EdgeInsetsDirectional.only(bottom: 16.h),
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
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Date
                Text(
                  '28 Nov 2023 11:00Am',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                6.verticalSpace,

                /// Title
                Text(
                  'Notification',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                4.verticalSpace,

                /// Body
                Text(
                  'Lorem ipsum dolor sit amet, consecte adipiscing '
                  'elit, sed do eiusmod tempor',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
