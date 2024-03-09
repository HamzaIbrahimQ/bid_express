
import 'package:bid_express/components/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddImageWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const AddImageWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105.w,
      height: 105.h,
      child: InkWell(
        splashColor: primaryColor.withOpacity(.05),
        highlightColor: primaryColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(6.r),
        onTap: onTap,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(6.r),
          dashPattern: const [15, 15],
          color: const Color(0xFFC7CBD1),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: SvgPicture.asset(
              'assets/icons/add_plus.svg',
              width: 20.w,
              height: 20.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
