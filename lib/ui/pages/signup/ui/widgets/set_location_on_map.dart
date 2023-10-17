import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetLocationOnMap extends StatelessWidget {
  const SetLocationOnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Set Location On The Map',
            style: TextStyle(fontSize: 12.sp),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(6.r),
            overlayColor: MaterialStatePropertyAll(
              primaryColor.withOpacity(.1),
            ),
            child: Ink(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F6FB),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: SvgPicture.asset('assets/icons/location_marker.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
