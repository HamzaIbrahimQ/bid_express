import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';
import 'package:bid_express/ui/pages/add_brands/ui/add_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModelWidget extends StatelessWidget {
  final Model model;
  final GestureTapCallback? onTap;
  final bool? isFromMyModels;

  const ModelWidget({
    super.key,
    required this.model,
    required this.onTap,
    this.isFromMyModels,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsetsDirectional.only(
          top: 26.h,
          bottom: 26.h,
          start: 12.w,
          end: 12.w,
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
            /// Name
            Text(
              model.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            /// Add icon
            Icon(
              isFromMyModels ?? false
                  ? Icons.delete_forever_outlined
                  : Icons.check_circle,
              size: 26.w,
              color: isFromMyModels ?? false
                  ? primaryColor
                  : model.isSelected ?? false
                      ? primaryColor
                      : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
