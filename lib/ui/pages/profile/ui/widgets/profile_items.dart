import 'package:bid_express/components/colors.dart';
import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/ui/pages/addresses/ui/add_address.dart';
import 'package:bid_express/ui/pages/addresses/ui/addresses_page.dart';
import 'package:bid_express/ui/pages/change_password/bloc/change_password_bloc.dart';
import 'package:bid_express/ui/pages/change_password/ui/chnage_password.dart';
import 'package:bid_express/ui/pages/home/ui/home_page.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
import 'package:bid_express/ui/pages/login/ui/login_page.dart';
import 'package:bid_express/ui/pages/profile/ui/widgets/profile_item.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItems extends StatelessWidget with UiUtility {
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
                title: 'myProfile'.tr(),
                onTap: () {},
              ),

              /// Address
              ProfileItem(
                title: 'myAddresses'.tr(),
                onTap: () => _goToAddresses(context),
              ),

              /// Cars manage
              ProfileItem(
                title: 'manageCars'.tr(),
                onTap: () {},
              ),

              /// Change pass
              ProfileItem(
                title: 'changePassword'.tr(),
                onTap: () => _goToChangePassword(context),
              ),

              /// Contact admin
              ProfileItem(
                title: 'contactAdministrator'.tr(),
                onTap: () {},
              ),

              /// Change lang
              ProfileItem(
                title: 'changeLang'.tr(),
                onTap: () => changeLang(context),
              ),

              /// Logout
              ProfileItem(
                title: 'logout'.tr(),
                onTap: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final SharedPreferenceHelper _sharedPreferenceHelper =
        SharedPreferenceHelper();
    await _sharedPreferenceHelper.deleteValue(key: 'accessToken');
    await _sharedPreferenceHelper.deleteValue(key: 'refreshToken');
    navigate(
      context: context,
      isFade: true,
      clearPagesStack: true,
      page: BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
    );
  }

  void _goToChangePassword(BuildContext context) {
    navigate(
      context: context,
      isFromBottom: true,
      page: BlocProvider(
        create: (context) => ChangePasswordBloc(),
        child: const ChangePasswordPage(),
      ),
    );
  }

  void _goToAddresses(BuildContext context) {
    navigate(
      context: context,
      isFromBottom: true,
      page: const AddressesPage(),
    );
  }
}
