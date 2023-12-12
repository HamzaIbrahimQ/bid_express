import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: greyColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
      suffixWidget: const Icon(Icons.search, color: greyColor),
      customContentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      textInputAction: TextInputAction.done,
      validator: (v) => null,
      onChange: onChange,
    );
  }
}
