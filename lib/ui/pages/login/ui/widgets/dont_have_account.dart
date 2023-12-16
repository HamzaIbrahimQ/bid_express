import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
import 'package:bid_express/ui/pages/login/ui/login_page.dart';
import 'package:bid_express/ui/pages/select_location/cubit/select_location_cubit.dart';
import 'package:bid_express/ui/pages/signup/bloc/signup_bloc.dart';
import 'package:bid_express/ui/pages/signup/ui/signup_page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAccount extends StatelessWidget with UiUtility {
  DontHaveAccount({Key? key}) : super(key: key);

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
                children: const [
                  TextSpan(
                    text: "Don't Have An Account? ",
                    style: TextStyle(
                      color: secondaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () => _goToSignupPage(context),
        ),
      ),
    );
  }

  void _goToSignupPage(BuildContext context) {
    navigate(
      context: context,
      isFromBottom: true,
      page: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignupBloc()),

          BlocProvider(
              create: (context) => SelectLocationCubit()
                ..checkLocationPermission(isFromInit: true)),
        ],
        child: const SignupPage(),
      ),
    );
  }
}
