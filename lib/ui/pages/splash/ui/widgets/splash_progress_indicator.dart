import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashProgressIndicator extends StatelessWidget {
  const SplashProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 104.w,
        end: 104.w,
        bottom: 64.w,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: LinearProgressIndicator(
          color: Colors.white,
          backgroundColor: const Color(0XFF2D384C),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
