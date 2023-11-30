import 'package:bid_express/components/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryCodeWidget extends StatelessWidget {
  final CountryCode countryCode;
  final bool? hasPadding;
  final ValueChanged<CountryCode>? onChanged;

  const CountryCodeWidget({
    Key? key,
    required this.countryCode,
    this.hasPadding,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h, end: 8.w),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          end: BorderSide(width: 1.8, color: greyColor),
        ),
      ),
      child: CountryCodePicker(
        onChanged: onChanged,
        initialSelection: countryCode.code,
        dialogSize: Size(1.sw, 1.sh),
        searchDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search by code or country name',
          hintMaxLines: 3,
          errorMaxLines: 2,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: greyColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: greyColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: greyColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: greyColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          counterText: '',
          counter: const SizedBox(
            width: 0,
            height: 0,
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: secondaryColor, fontSize: 11.sp),
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.red),
        ),
        textStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: textFieldColor),
      ),
    );
  }
}
