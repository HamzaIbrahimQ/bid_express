import 'package:another_flushbar/flushbar.dart';
import 'package:bid_express/components/colors.dart';
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
    PreferredSizeWidget? bottomWidget,
    List<Widget>? actions,
  }) {
    return AppBar(
      forceMaterialTransparency: appBarColor == null,
      backgroundColor: appBarColor ?? Colors.white,
      toolbarHeight: appBarColor == null ? 64.h : null,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      shadowColor: appBarColor ?? Colors.white,
      elevation: 0.0,
      bottom: bottomWidget,
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
      actions: actions,
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
     Function(dynamic value)? then,
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
      ).then((value) {
        if (then != null) then(value);
      });
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
          (route) => false).then((value) {
        if (then != null) then(value);
      });
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
      ).then((value) {
        if (then != null) then(value);
      });
    }
  }

  void showErrorToast({
    required BuildContext context,
    String? title,
    String? msg,
    int? duration,
    VoidCallback? onPressed,
    Widget? button,
  }) async {
    await Flushbar(
      titleText: Text(title ?? 'Oops',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white)),
      messageText: Text(
          msg ??
              'Something went wrong, please check your internet '
                  'connection and try again later',
          style: Theme.of(context).textTheme.bodySmall),
      mainButton: Padding(
        padding: EdgeInsetsDirectional.only(start: 2.w, end: 4.w),
        child: button,
      ),
      onTap: (f) => Navigator.of(context).pop(),
      animationDuration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(15),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: Duration(seconds: duration ?? 3),
    ).show(context);
  }

  void showInfoToast(
      {required BuildContext context,
      String? title,
      required String msg}) async {
    await Flushbar(
      titleText: Text(title ?? 'Info',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white)),
      messageText: Text(msg, style: Theme.of(context).textTheme.bodySmall),
      animationDuration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(15),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: primaryColor,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  void showSuccessToast({
    required BuildContext context,
    String? title,
    String? msg,
    int? duration,
    VoidCallback? onPressed,
    Widget? button,
  }) async {
    await Flushbar(
      titleText: Text(title ?? 'Success',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white)),
      messageText: Text(msg ?? 'Process completed successfully',
          style: Theme.of(context).textTheme.bodySmall),
      mainButton: Padding(
        padding: EdgeInsetsDirectional.only(start: 2.w, end: 4.w),
        child: button,
      ),
      onTap: (f) => Navigator.of(context).pop(),
      animationDuration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(15),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: primaryColor,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: Duration(seconds: duration ?? 3),
    ).show(context);
  }


}
