import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 8.h),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.all(
              greyColor.withOpacity(.15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 12.sp),
                children: [
                  const TextSpan(
                    text: "Don't Have An Account? ",
                    style: TextStyle(
                      color: secondaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: secondaryColor.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () => _goToSignUpPage(),
        ),
      ),
    );
  }

  void _goToSignUpPage() {}
}
