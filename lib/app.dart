import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/profile/ui/profile_page.dart';
import 'package:bid_express/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:bid_express/ui/pages/splash/ui/splash_page.dart';
import 'package:bid_express/utils/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidExpressApp extends StatelessWidget {
  const BidExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BidExpress app',
          theme: AppTheme().appTheme(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: BlocProvider(
            create: (context) => SplashBloc()..add(GetInitValues()),
            child: SplashPage(),
          ),
        );
      },
    );
  }
}
