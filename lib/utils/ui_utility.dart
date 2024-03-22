import 'package:another_flushbar/flushbar.dart';
import 'package:bid_express/components/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
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

  void changeLang(BuildContext context) {
    if (context.locale.languageCode == 'en') {
      context.setLocale(const Locale('ar', 'JO'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
  }

  List<Widget> createStarsRate(double startRate) {
    final int startInt = startRate.ceil();
    final List<Widget> starsWidgets = [];
    for (int x = 0; x < startInt; x++) {
      if (starsWidgets.length < 5) {
        starsWidgets.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Icon(
            Icons.star,
            size: 12.sp,
            color: const Color(0xffF5B510),
          ),
        ));
      }
    }
    while (starsWidgets.length < 5) {
      starsWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Icon(Icons.star_border_purple500_sharp,
              color: const Color(0xFFF5B510), size: 12.sp),
        ),
      );
    }
    print('start length is: ${starsWidgets.length}');
    return starsWidgets;
  }

  String createTitleString(List<String?> carParts) {
    String carPartsString = '';

    for (int x = 0; x < carParts.length; x++) {
      carPartsString = carPartsString + (carParts[x] ?? '');
      if (x != carParts.length - 1) {
        carPartsString = carPartsString + ' / ';
      }
    }
    return carPartsString;
  }

  Future showImageSourceDialog({
    required BuildContext context,
    required Function onCamera,
    required Function onGallery,
    ImageSource? source,
  }) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoActionSheetAction(
              child: Text(
                'Gallery',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 14.sp,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onGallery();
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                'Camera',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 14.sp,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onCamera();
              },
            ),
          ],
        ),
      ),
    );
  }

  int differenceInDays(DateTime date) {
    final DateTime now = DateTime.now();
    // Calculate the difference in milliseconds
    final int differenceInMilliseconds =
        date.millisecondsSinceEpoch - now.millisecondsSinceEpoch;
    // Convert milliseconds to days
    final int differenceInDays =
        (differenceInMilliseconds / (1000 * 60 * 60 * 24)).round().abs();
    return differenceInDays;
  }
}
