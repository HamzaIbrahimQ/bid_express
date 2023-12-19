import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              'assets/imgs/logo.svg'
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 72.w,
              end: 8.w,
              bottom: 8.h,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                'CARPARTS',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  height: 1.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
