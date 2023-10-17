import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/dont_have_account.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/forgot_password.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with UiUtility {
  final TextEditingController _mobileCont = TextEditingController();
  final FocusNode _mobileFoc = FocusNode();
  final TextEditingController _passCont = TextEditingController();
  final FocusNode _passFoc = FocusNode();

  @override
  void dispose() {
    _mobileCont.dispose();
    _mobileFoc.dispose();
    _passCont.dispose();
    _passFoc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Login'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// Logo
              Padding(
                padding: EdgeInsets.symmetric(vertical: 48.h),
                child: Center(
                  child: SvgPicture.asset('assets/imgs/login_logo.svg'),
                ),
              ),

              /// Mobile field
              AppTextField(
                controller: _mobileCont,
                focusNode: _mobileFoc,
                title: 'Mobile number',
                inputType: TextInputType.number,
              ),

              12.verticalSpace,

              /// Password field
              AppTextField(
                controller: _passCont,
                focusNode: _passFoc,
                title: 'Password',
                isPassword: true,
                isObscure: true,
                textInputAction: TextInputAction.done,
              ),

              6.verticalSpace,

              /// Forget password
              const ForgotPassword(),

              40.verticalSpace,

              /// Login button
              MainButton(
                title: 'Login',
                onTap: () {},
              ),

              .18.sh.verticalSpace,

              /// Dont have account
              const DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }



}
