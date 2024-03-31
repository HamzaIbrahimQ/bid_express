import 'package:bid_express/components/colors.dart';
import 'package:bid_express/generated/assets.dart';
import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
import 'package:bid_express/ui/pages/login/ui/login_page.dart';
import 'package:bid_express/ui/pages/onboarding/ui/widgets/onboarding_body_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with UiUtility {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Let\'s go',
      onFinish: () {
        _sharedPreferenceHelper.saveBooleanValue(
            key: 'isFirstRun', value: false);
        _goToLoginPage(context);
      },
      finishButtonStyle:
          const FinishButtonStyle(backgroundColor: secondaryColor),
      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16.sp,
          color: secondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      skipFunctionOverride: () {
        _sharedPreferenceHelper.saveBooleanValue(
            key: 'isFirstRun', value: false);
        _goToLoginPage(context);
      },
      controllerColor: secondaryColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Lottie.asset(
          Assets.lottiesOnboarding1,
          height: 400.h,
          width: 1.sw,
          fit: BoxFit.contain,
        ),
        Lottie.asset(
          Assets.lottiesOnboarding2,
          height: 400.h,
          width: 1.sw,
          fit: BoxFit.contain,
        ),
        Lottie.asset(
          Assets.lottiesOnboarding3,
          height: 400.h,
          width: 1.sw,
          fit: BoxFit.contain,
        ),
      ],
      speed: 1.8,
      pageBodies: const [
        /// First
        OnboardingBodyWidget(
          title: 'Welcome in BidExpress',
          desc: 'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry. Lorem Ipsum has been the industry\'s'
              ' standard dummy text ever since the 1500s, when an unknown '
              'printer took a galley of type and scrambled it to make a '
              'type specimen book.',
        ),

        /// Second
        OnboardingBodyWidget(
          title: 'Receive orders and make bids!',
          desc: 'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry. Lorem Ipsum has been the industry\'s'
              ' standard dummy text ever since the 1500s, when an unknown '
              'printer took a galley of type and scrambled it to make a '
              'type specimen book.',
        ),

        /// Third
        OnboardingBodyWidget(
          title: 'Are you ready?',
          desc: 'Lets Build your store',
        ),
      ],
    );
  }

  void _goToLoginPage(BuildContext context) {
    navigate(
      context: context,
      isReplacement: true,
      isFade: true,
      page: BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
    );
  }
}
