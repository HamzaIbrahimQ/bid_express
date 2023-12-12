import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/add_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandWidget extends StatelessWidget {
  final Brand brand;

  const BrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AddBrandsBloc(),
              child: AddModelPage(
                brand: brand,
              ),
            ),
          ),
        );
      },
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsetsDirectional.only(
          top: 28.h,
          bottom: 28.h,
          start: 12.w,
          end: 6.w,
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Image and name
            Row(
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

            /// Add icon
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              color: primaryColor,
              icon: Icon(Icons.add, size: 36.w),
            ),
          ],
        ),
      ),
    );
  }
}
