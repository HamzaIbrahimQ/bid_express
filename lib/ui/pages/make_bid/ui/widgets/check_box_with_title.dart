import 'package:bid_express/components/colors.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxWithTitle extends StatefulWidget {
  final String title;
  bool value;
  final ValueChanged<bool> onChanged;

  CheckboxWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CheckboxWithTitle> createState() => _CheckboxWithTitleState();
}

class _CheckboxWithTitleState extends State<CheckboxWithTitle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!widget.value),
      borderRadius: BorderRadius.circular(6.r),

      child: Row(
        children: [
          /// Checkbox
          Transform.scale(
            scale: 1.3,
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

          /// Title
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 13.sp,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
