import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandWidget extends StatelessWidget {
  final Brand brand;

  const BrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
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
        ],
      ),
      child: Row(
        children: [
          /// Image
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 8.h,
              ),
              child: SvgPicture.asset(
                'assets/imgs/logo.svg',
                width: 28.w,
                height: 28.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          12.horizontalSpace,

          /// Name
          Text(
            brand.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
