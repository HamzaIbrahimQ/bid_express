import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

mixin UiUtility {
  /// Common app bar design for the app
  AppBar getAppBar({
    required String title,
    Color? appBarColor,
    bool? hasBackIcon,
    Color? backArrowColor,
  }) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: appBarColor ?? Colors.white,
      toolbarHeight: 64.h,
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0XFF2D3D5E),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,

      leading: hasBackIcon ?? false
          ? SvgPicture.asset(
              'assets/icons/back.svg',
              colorFilter: ColorFilter.mode(
                backArrowColor ?? const Color(0XFF2D3D5E),
                BlendMode.srcIn,
              ),
            )
          : null,
    );
  }

  /// Sweat animation for navigation between pages
  void navigate({
    required BuildContext context,
    required Widget page,
    bool? isFade,
    bool? isReplacement,
    bool? isFromBottom,
    bool? clearPagesStack,
    Duration? duration,
  }) {
    if (isReplacement ?? false) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          duration: duration ?? const Duration(milliseconds: 600),
          type: (isFade ?? false)
              ? PageTransitionType.fade
              : (isFromBottom ?? false)
                  ? PageTransitionType.bottomToTop
                  : PageTransitionType.rightToLeft,
          child: page,
        ),
      );
    } else if (clearPagesStack ?? false) {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            duration: duration ?? const Duration(milliseconds: 600),
            type: (isFade ?? false)
                ? PageTransitionType.fade
                : (isFromBottom ?? false)
                    ? PageTransitionType.bottomToTop
                    : PageTransitionType.rightToLeft,
            child: page,
          ),
          (route) => false);
    } else {
      Navigator.push(
        context,
        PageTransition(
          curve: Curves.elasticIn,
          duration: duration ?? const Duration(milliseconds: 600),
          type: (isFade ?? false)
              ? PageTransitionType.fade
              : (isFromBottom ?? false)
                  ? PageTransitionType.bottomToTop
                  : PageTransitionType.rightToLeft,
          child: page,
        ),
      );
    }
  }
}
