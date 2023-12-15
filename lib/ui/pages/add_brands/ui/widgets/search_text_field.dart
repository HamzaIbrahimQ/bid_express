import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChange;
  final String? hint;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChange,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      hint: hint ?? 'Brand name',
      hintTextStyle: TextStyle(
        color: secondaryColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
      borderColor: const Color(0xFFC7CBD1),

      suffixWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: SvgPicture.asset(
          'assets/icons/search.svg',
          width: 20.w,
          height: 20.h,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
            Color(0xFF2D3D5E),
            BlendMode.srcIn,
          ),
        ),
      ),
      customContentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      textInputAction: TextInputAction.done,
      validator: (v) => null,
      onChange: onChange,
    );
  }
}
