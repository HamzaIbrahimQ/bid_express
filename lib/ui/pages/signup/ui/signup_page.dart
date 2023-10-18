import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/signup/ui/widgets/address_title.dart';
import 'package:bid_express/ui/pages/signup/ui/widgets/set_location_on_map.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with UiUtility {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameCont = TextEditingController();
  final FocusNode _businessNameFoc = FocusNode();

  final TextEditingController _mobileCont = TextEditingController();
  final FocusNode _mobileFoc = FocusNode();

  final TextEditingController _passCont = TextEditingController();
  final FocusNode _passFoc = FocusNode();

  final TextEditingController _confirmPassCont = TextEditingController();
  final FocusNode _confirmPassFoc = FocusNode();

  final TextEditingController _cityCont = TextEditingController();
  final FocusNode _cityFoc = FocusNode();

  final TextEditingController _areaCont = TextEditingController();
  final FocusNode _areaFoc = FocusNode();

  final TextEditingController _streetCont = TextEditingController();
  final FocusNode _streetFoc = FocusNode();

  final TextEditingController _buildingCont = TextEditingController();
  final FocusNode _buildingFoc = FocusNode();

  @override
  void dispose() {
    _businessNameCont.dispose();
    _businessNameFoc.dispose();
    _mobileCont.dispose();
    _mobileFoc.dispose();
    _passCont.dispose();
    _passFoc.dispose();
    _confirmPassCont.dispose();
    _confirmPassFoc.dispose();
    _cityCont.dispose();
    _cityFoc.dispose();
    _areaCont.dispose();
    _areaFoc.dispose();
    _streetCont.dispose();
    _streetFoc.dispose();
    _buildingCont.dispose();
    _buildingFoc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Sign Up', hasBackIcon: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.verticalSpace,

              /// Form fields
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Business name field
                    AppTextField(
                      controller: _businessNameCont,
                      focusNode: _businessNameFoc,
                      title: 'Business Name',
                      hint: 'Enter Your Business Name',
                      inputType: TextInputType.name,
                      regex: businessNameRegex,
                      onSaved: (val) => {},
                    ),

                    12.verticalSpace,

                    /// Mobile field
                    AppTextField(
                      controller: _mobileCont,
                      focusNode: _mobileFoc,
                      title: 'Mobile number',
                      hint: 'Enter Your Mobile number',
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
                      onSubmit: (val) => _confirmPassFoc.requestFocus(),
                      onSaved: (val) => {},
                    ),

                    12.verticalSpace,

                    /// Confirm password field
                    AppTextField(
                      controller: _confirmPassCont,
                      focusNode: _confirmPassFoc,
                      title: 'Confirm Password',
                      hint: 'Re-Enter Password',
                      isPassword: true,
                      isObscure: true,
                      regex: passwordRegex,
                      maxLength: 16,
                      onSubmit: (val) => _cityFoc.requestFocus(),
                      onSaved: (val) => {},
                      validator: (value) {
                        final regex = passwordRegex;
                        if (value?.trim().isEmpty ?? false) {
                          return 'This field is required';
                        } else if (!regex.hasMatch(value ?? '')) {
                          return 'one uppercase letter, one lowercase letter, '
                              'one digit,'
                              ' one special character, 8 characters, no spaces';
                        }
                        if (value?.trim() != _passCont.text.trim()) {
                          return 'The passwords do not match';
                        } else {
                          return null;
                        }
                      },
                    ),

                    /// Address title
                    const AddressTitle(),

                    /// City field
                    AppTextField(
                      controller: _cityCont,
                      focusNode: _cityFoc,
                      title: 'City',
                      hint: 'Located city',
                      inputType: TextInputType.name,
                      regex: businessNameRegex,
                      onSaved: (val) => {},
                    ),

                    12.verticalSpace,

                    /// Area field
                    AppTextField(
                      controller: _areaCont,
                      focusNode: _areaFoc,
                      title: 'Area',
                      hint: 'Located Area',
                      inputType: TextInputType.name,
                      regex: businessNameRegex,
                      onSaved: (val) => {},
                    ),

                    12.verticalSpace,

                    /// Street field
                    AppTextField(
                      controller: _streetCont,
                      focusNode: _streetFoc,
                      title: 'Street',
                      hint: 'Street Name, Number..',
                      inputType: TextInputType.name,
                      regex: streetAndBuildingRegex,
                      onSaved: (val) => {},
                    ),

                    12.verticalSpace,

                    /// Building field
                    AppTextField(
                      controller: _buildingCont,
                      focusNode: _buildingFoc,
                      title: 'Building',
                      hint: 'Building Number',
                      isRequired: false,
                      inputType: TextInputType.name,
                      regex: streetAndBuildingRegex,
                      textInputAction: TextInputAction.done,
                      onSaved: (val) => {},
                    ),
                  ],
                ),
              ),

              /// Set location on map
              const SetLocationOnMap(),

              /// Login button
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: MainButton(
                  title: 'PROCEED',
                  onTap: () => _validate(),
                ),
              ),
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
          _callSignupApi();
        });
      } else {
        _callSignupApi();
      }
    }
  }

  void _callSignupApi() {}
}
