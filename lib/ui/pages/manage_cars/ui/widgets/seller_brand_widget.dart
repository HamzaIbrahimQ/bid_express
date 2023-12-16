import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerBrandWidget extends StatelessWidget {
  final GetCarsResponse brand;

  const SellerBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 6.w),
      child: InkWell(
        onTap: brand.isSelected ?? false
            ? () {}
            : () => context
                .read<ManageCarsBloc>()
                .add(SelectBrand(brandId: brand.brandId ?? 0)),
        borderRadius: BorderRadius.circular(6.r),
        // overlayColor: MaterialStatePropertyAll(Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: brand.isSelected ?? false
                ? const Color(0xFF1C81F2)
                : primaryColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsetsDirectional.only(
            start: 15.w,
            end: 15.w,
            top: 15.h,
            bottom: 7.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Car logo
              SvgPicture.network(
                brand.imageUrl ?? '',
                width: 50.w,
                fit: BoxFit.cover,
                placeholderBuilder: (context) {
                  return SvgPicture.asset(
                    'assets/imgs/logo.svg',
                    width: 50.w,
                    // height: 28.h,
                    fit: BoxFit.cover,
                  );
                },
              ),

              12.verticalSpace,

              Text(
                brand.name ?? '',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
