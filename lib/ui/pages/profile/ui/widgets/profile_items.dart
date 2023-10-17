import 'package:bid_express/components/colors.dart';
import 'package:bid_express/ui/pages/profile/ui/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(color: greyColor.withOpacity(.2)),

              /// Profile
              ProfileItem(
                title: 'My Profile',
                onTap: () {},
              ),

              /// Address
              ProfileItem(
                title: 'My Address',
                onTap: () {},
              ),

              /// Cars manage
              ProfileItem(
                title: 'Cars Manage',
                onTap: () {},
              ),

              /// Change pass
              ProfileItem(
                title: 'Change Password',
                onTap: () {},
              ),

              /// Contact admin
              ProfileItem(
                title: 'Contact Administrator',
                onTap: () {},
              ),

              /// Logout
              ProfileItem(
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
