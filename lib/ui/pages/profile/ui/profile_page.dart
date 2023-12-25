import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/profile/ui/widgets/profile_items.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with UiUtility, Utility {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'myProfile'.tr(),
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
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 8.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.asset(
                  'assets/imgs/user.png',
                  alignment: Alignment.center,
                  height: .18.sh,
                  // width: ,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// User name
          Align(
            alignment: Alignment.topCenter,
            child: FutureBuilder<String>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                } else {
                  return SizedBox(
                    width: .5.sw,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(top: .21.sh),
                        child: Text(
                          snapshot.data ?? '',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
