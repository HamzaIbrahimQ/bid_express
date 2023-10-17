import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBg extends StatelessWidget {
  const SplashBg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/imgs/bg.svg',
      width: 1.sw,
      height: 1.sh,
      fit: BoxFit.cover,
    );
  }
}
