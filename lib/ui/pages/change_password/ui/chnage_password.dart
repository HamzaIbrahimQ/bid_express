import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/profile/ui/widgets/profile_items.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>
    with UiUtility {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPassCont = TextEditingController();
  final FocusNode _oldPassFoc = FocusNode();
  final TextEditingController _newPassCont = TextEditingController();
  final FocusNode _newPassFoc = FocusNode();
  final TextEditingController _confNewPassCont = TextEditingController();
  final FocusNode _confNewPassFoc = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _oldPassCont.dispose();
    _oldPassFoc.dispose();
    _newPassCont.dispose();
    _newPassFoc.dispose();
    _confNewPassCont.dispose();
    _confNewPassFoc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'Change Password',
        hasBackIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            16.verticalSpace,

            Expanded(
              flex: 3,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Old password
                      AppTextField(
                        controller: _oldPassCont,
                        focusNode: _oldPassFoc,
                        title: 'Old Password',
                        hint: 'Enter Old Password',
                        isPassword: true,
                        isObscure: true,
                        regex: passwordRegex,
                        maxLength: 16,
                        onSubmit: (val) => _newPassFoc.requestFocus(),
                        onSaved: (val) => {},
                      ),

                      12.verticalSpace,

                      /// New password field
                      AppTextField(
                        controller: _newPassCont,
                        focusNode: _newPassFoc,
                        title: 'New Password',
                        hint: 'Enter New Password',
                        isPassword: true,
                        isObscure: true,
                        regex: passwordRegex,
                        maxLength: 16,
                        onSubmit: (val) => _confNewPassFoc.requestFocus(),
                        onSaved: (val) => {},
                      ),

                      12.verticalSpace,

                      /// Confirm new password field
                      AppTextField(
                        controller: _confNewPassCont,
                        focusNode: _confNewPassFoc,
                        title: 'Confirm New Password',
                        hint: 'Re-Enter New Password',
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
              ),
            ),

            /// Save button
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: MainButton(
                    title: 'SAVE',
                    onTap: () => _validate(),
                  ),
                ),
              ),
            ),
          ],
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
          _callChangePassApi();
        });
      } else {
        _callChangePassApi();
      }
    }
  }

  void _callChangePassApi() {}
}
