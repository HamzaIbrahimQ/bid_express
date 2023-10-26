import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/ui/pages/profile/ui/profile_page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget with UiUtility {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            16.verticalSpace,
            MainButton(
              title: 'Profile',
              onTap: () {
                navigate(
                  context: context,
                  page: ProfilePage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
