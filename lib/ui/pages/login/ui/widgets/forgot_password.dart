import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/change_password/ui/chnage_password.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget with UiUtility {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.all(
            greyColor.withOpacity(.15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            'forgotPassword'.tr(),
            style: TextStyle(
              fontFamily: 'SofiaPro',
              color: const Color(0xFF263C65),
              fontSize: 11.sp,
            ),
          ),
        ),
        onPressed: () => _goToForgetPasswordPage(context),
      ),
    );
  }

  void _goToForgetPasswordPage(BuildContext context) {
    navigate(
      context: context,
      page: const ChangePasswordPage(),
    );
  }
}
