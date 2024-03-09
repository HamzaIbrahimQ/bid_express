
import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupMenuWidget extends StatelessWidget {
  final String firstActionTitle;
  final String secondActionTitle;
  final VoidCallback firstAction;
  final VoidCallback secondAction;

  const PopupMenuWidget({
    required this.firstActionTitle,
    required this.secondActionTitle,
    required this.firstAction,
    required this.secondAction,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      icon: SvgPicture.asset(
       'assets/icons/order_options_icon.svg',
        fit: BoxFit.cover,
        height: 22.h,
      ),
      itemBuilder: (BuildContext context) {
        return [
          /// Edit
          PopupMenuItem(
            child: Row(
              children: [
                /// Edit icon
                SvgPicture.asset(
                  'assets/icons/ignore.svg',
                  width: 22.w,
                  height: 22.h,
                  fit: BoxFit.cover,
                ),

                12.horizontalSpace,

                /// Edit title
                Text(
                  firstActionTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onTap: firstAction,
          ),

          /// Delete
          PopupMenuItem(
            child: Row(
              children: [
                /// Delete icon
                SvgPicture.asset(
                  'assets/icons/delete.svg',
                  width: 18.w,
                  height: 22.h,
                  fit: BoxFit.cover,
                ),

                12.horizontalSpace,

                /// Delete title
                Text(
                  secondActionTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onTap: secondAction,
          ),
        ];
      },
    );
  }
}
