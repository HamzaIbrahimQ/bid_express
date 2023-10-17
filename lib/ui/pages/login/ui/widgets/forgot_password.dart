import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
            'Forgot your password?',
            style: TextStyle(
              color: const Color(0xFF263C65),
              fontSize: 11.sp,
            ),
          ),
        ),
        onPressed: () => _goToForgetPasswordPage(),
      ),
    );
  }

  void _goToForgetPasswordPage() {}
}
