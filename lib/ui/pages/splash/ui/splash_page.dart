import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/addresses/ui/add_address.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
import 'package:bid_express/ui/pages/login/ui/login_page.dart';
import 'package:bid_express/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:bid_express/ui/pages/splash/ui/widgets/logo.dart';
import 'package:bid_express/ui/pages/splash/ui/widgets/splash_progress_indicator.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget with UiUtility {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBgColor,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is GetInitValuesSuccessState) {
            _openApp(
                context: context,
                accessToken: state.accessToken,
                isFirstRun: state.isFirstRun);
          }
        },
        child: const Stack(
          fit: StackFit.expand,
          children: [
            SplashLogo(),
            SplashProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _openApp({
    required BuildContext context,
    required String accessToken,
    required bool isFirstRun,
  }) {
    navigate(
      context: context,
      isFade: true,
      clearPagesStack: true,
      duration: accessToken.isNotEmpty ? const Duration(milliseconds: 0) : null,
      page:
          // !isFirstRun
          //     ? const Onboarding()
          //     : accessToken.isNotEmpty
          //     ? const BottomNavBar()
          //     :
          BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
    );
  }
}
