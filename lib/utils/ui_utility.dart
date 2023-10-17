import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

mixin UiUtility {
  /// Common app bar design for the app
  AppBar getAppBar({
    required BuildContext context,
    required String title,
    Color? titleColor,
    Color? appBarColor,
    bool? hasBackIcon,
    VoidCallback? onBackPressed,
    Color? backArrowColor,
  }) {
    return AppBar(
      forceMaterialTransparency: appBarColor == null,
      backgroundColor: appBarColor ?? Colors.white,
      toolbarHeight: appBarColor ==  null? 64.h : null,
      shadowColor: appBarColor ?? Colors.white,
      elevation: 0.0,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? const Color(0XFF2D3D5E),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leadingWidth: hasBackIcon ?? false ? 72.w : 0,
      leading: hasBackIcon == true
          ? IconButton(
              onPressed: () {
                if (onBackPressed != null) {
                  onBackPressed();
                } else {
                  Navigator.of(context).pop('SUCCESS');
                }
              },
              icon: SvgPicture.asset(
                'assets/icons/back.svg',
                width: 22.w,
                height: 12.h,
                colorFilter: ColorFilter.mode(
                  backArrowColor ?? const Color(0XFF2D3D5E),
                  BlendMode.srcIn,
                ),
              ),
            )
          : const SizedBox(),
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
