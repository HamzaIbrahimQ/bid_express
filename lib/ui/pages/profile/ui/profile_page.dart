import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/profile/ui/widgets/profile_item.dart';
import 'package:bid_express/ui/pages/profile/ui/widgets/profile_items.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget with UiUtility {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'My Profile',
        titleColor: Colors.white,
        appBarColor: splashBgColor,
      ),
      body: Stack(
        children: [
          /// Page content
          Column(
            children: [
              /// Empty space
              Container(
                width: 1.sw,
                height: .1.sh,
                color: splashBgColor,
              ),

              .24.sh.verticalSpace,

              /// Profile items
              const ProfileItems(),
            ],
          ),

          /// Profile image and user name
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                /// Profile image
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 84.w, top: 8.h),
                  child: Image.asset(
                    'assets/imgs/profile_img.png',
                    alignment: Alignment.center,
                    height: .25.sh,
                    // width: ,
                    fit: BoxFit.cover,
                  ),
                ),


                /// User name
                Text(
                  'Julia Ustinovich',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
