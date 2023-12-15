import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const NavBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
              width: 19.1.w,
              height: 19.1.h,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? const Color(0XFF0057B8)
                    : const Color(0xFF2D3D5E),
                BlendMode.srcIn,
              ),
            ),
            4.verticalSpace,
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0XFF0057B8)
                    : const Color(0xFF2D3D5E),
                fontSize: 9.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
