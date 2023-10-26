import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPageMessage extends StatelessWidget {
  const OtpPageMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please enter the code that has been sent to you at '
          'number 772127805',
      textAlign: TextAlign.center,
      style: TextStyle(color: secondaryColor, fontSize: 13.sp),
    );
  }
}
