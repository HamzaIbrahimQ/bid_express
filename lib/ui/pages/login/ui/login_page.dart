import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/dont_have_account.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/forgot_password.dart';
import 'package:bid_express/ui/pages/profile/ui/profile_page.dart';
import 'package:bid_express/ui/pages/signup/bloc/signup_bloc.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with UiUtility {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      appBar: getAppBar(context: context, title: 'Login'),
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

              /// Form fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    /// Mobile field
                    AppTextField(
                      controller: _mobileCont,
                      focusNode: _mobileFoc,
                      title: 'Mobile number',
                      hint: 'Enter Mobile Number',
                      isMobileNumber: true,
                      inputType: TextInputType.number,
                      regex: mobileRegex,
                      onSaved: (val) => {},
                    ),

                    12.verticalSpace,

                    /// Password field
                    AppTextField(
                      controller: _passCont,
                      focusNode: _passFoc,
                      title: 'Password',
                      hint: 'Enter Password',
                      isPassword: true,
                      isObscure: true,
                      regex: passwordRegex,
                      maxLength: 16,
                      textInputAction: TextInputAction.done,
                      onSubmit: (val) => _validate(isKeyboardOpen: true),
                      onSaved: (val) => {},
                    ),
                  ],
                ),
              ),

              6.verticalSpace,

              /// Forget password
              ForgotPassword(),

              24.verticalSpace,

              /// Login button
              MainButton(
                title: 'Login',
                onTap: () => _validate(),
              ),

              .17.sh.verticalSpace,

              /// Dont have account
              DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  void _validate({bool? isKeyboardOpen}) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    } else {
      _formKey.currentState?.save();
      if (isKeyboardOpen ?? false) {
        FocusManager.instance.primaryFocus?.unfocus();
        Future.delayed(const Duration(milliseconds: 300)).then((value) {
          _callLoginApi();
        });
      } else {
        _callLoginApi();
      }
    }
  }

  void _callLoginApi() {
    navigate(
      context: context,
      page: ProfilePage(),
    );
  }
}
