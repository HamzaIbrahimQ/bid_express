import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;

  const ProfileItem({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6.r),
          overlayColor: MaterialStatePropertyAll(
            primaryColor.withOpacity(.1),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Title
                Text(
                  title,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                /// Arrow icon
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: secondaryColor,
                ),
              ],
            ),
          ),
        ),
        Divider(color: greyColor.withOpacity(.2)),
      ],
    );
  }
}
