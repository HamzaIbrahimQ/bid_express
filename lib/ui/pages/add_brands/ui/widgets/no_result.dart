import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoResult extends StatelessWidget {
  final String? title;
  const NoResult({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text(
          title ?? 'No Result',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
