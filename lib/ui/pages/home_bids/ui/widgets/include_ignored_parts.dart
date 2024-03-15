import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncludeIgnoredParts extends StatefulWidget {
  final String title;
  bool value;
  final ValueChanged<bool> onChanged;

  IncludeIgnoredParts({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  State<IncludeIgnoredParts> createState() => _IncludeIgnoredPartsState();
}

class _IncludeIgnoredPartsState extends State<IncludeIgnoredParts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only( start: 24.w, end: 24.w),
      child: InkWell(
        onTap: () => widget.onChanged(!widget.value),
        borderRadius: BorderRadius.circular(6.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// Title
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 8.w),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// Checkbox
            Transform.scale(
              scale: 1.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.r),
                child: Checkbox.adaptive(
                  value: widget.value,
                  activeColor: primaryColor,
                  side: BorderSide(
                    width: 1.w,
                    color: const Color(0xFF0057B8),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  onChanged: (v) => widget.onChanged(v ?? false),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
