import 'dart:io';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  final File file;
  final VoidCallback? onCancel;

  const ImageWidget({required this.file, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        /// Image
        Container(
          width: 105.w,
          height: 105.h,
          padding: EdgeInsetsDirectional.only(end: 6.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        /// Cancel icon
        PositionedDirectional(
          top: 0,
          end: 0,
          child: IconButton(
            onPressed: onCancel,
            padding: EdgeInsetsDirectional.only(bottom: 8.h),
            icon: SvgPicture.asset(
             'assets/icons/cancel_image.svg',
              width: 20.w,
              height: 20.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
