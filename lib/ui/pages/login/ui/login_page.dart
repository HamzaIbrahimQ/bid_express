import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/add_brands.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/country_code.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/dont_have_account.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/forgot_password.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
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
  late LoginBloc _bloc;

  final GlobalKey<FormState> _mobileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passFormKey = GlobalKey<FormState>();

  final TextEditingController _mobileCont = TextEditingController();
  final FocusNode _mobileFoc = FocusNode();

  final TextEditingController _passCont = TextEditingController();
  final FocusNode _passFoc = FocusNode();

  CountryCode countryCode = CountryCode(code: 'JO', dialCode: '962');

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _mobileCont.text = '7721235';
      _passCont.text = 'Aa@11111';
    }
  }

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
    _bloc = context.read<LoginBloc>();
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'login'.tr(),
        actions: [
          /// Change language
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: IconButton(
              onPressed: () => _changeLang(),
              tooltip: 'changeLang'.tr(),
              icon: Icon(
                Icons.language,
                size: 26.w,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            LoadingView.shared.startLoading(context);
          }

          if (state is LoginSuccessState) {
            LoadingView.shared.stopLoading();
            _goToHomePage();
          }

          if (state is LoginErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context, msg: state.error ?? '');
          }

          if (state is LoginFailureState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context);
          }
        },
        builder: (context, state) {
          return Padding(
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
                  Column(
                    children: [
                      /// Mobile field and country code
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Form(
                            key: _mobileFormKey,
                            child: AppTextField(
                              controller: _mobileCont,
                              focusNode: _mobileFoc,
                              title: 'mobileNumber'.tr(),
                              hint: 'enterMobileNumber'.tr(),
                              regex: mobileRegex,
                              isMobileNumber: true,
                              prefixWidget: CountryCodeWidget(
                                countryCode: countryCode,
                                onChanged: (val) {
                                  countryCode = val;
                                },
                                hasPadding:
                                    !(_mobileFormKey.currentState?.validate() ??
                                        false),
                              ),
                              onChange: (v) => setState(() {}),
                              inputType: TextInputType.number,
                              onSaved: (val) =>
                                  _bloc.loginRequest.userName = val?.trim(),
                            ),
                          );
                        },
                      ),

                      12.verticalSpace,

                      /// Password field
                      Form(
                        key: _passFormKey,
                        child: AppTextField(
                          controller: _passCont,
                          focusNode: _passFoc,
                          title: 'password'.tr(),
                          hint: 'enterPassword'.tr(),
                          isRequired: true,
                          isPassword: true,
                          isObscure: true,
                          regex: passwordRegex,
                          maxLength: 16,
                          textInputAction: TextInputAction.done,
                          onSubmit: (val) => _validate(isKeyboardOpen: true),
                          onSaved: (val) =>
                              _bloc.loginRequest.password = val?.trim(),
                        ),
                      ),
                    ],
                  ),

                  6.verticalSpace,

                  /// Forget password
                  ForgotPassword(),

                  24.verticalSpace,

                  /// Login button
                  MainButton(
                    title: 'login'.tr(),
                    onTap: () => _validate(),
                  ),

                  16.verticalSpace,

                  /// Dont have account
                  DontHaveAccount(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _validate({bool? isKeyboardOpen}) {
    final _isMobileNotValid =
        !(_mobileFormKey.currentState?.validate() ?? false);
    final _isPassNotValid = !(_passFormKey.currentState?.validate() ?? false);
    if (_isMobileNotValid || _isPassNotValid) {
      return;
    } else {
      _mobileFormKey.currentState?.save();
      _passFormKey.currentState?.save();
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
    _bloc.add(Login());
  }

  void _goToHomePage() {
    // navigate(
    //   context: context,
    //   isFade: true,
    //   clearPagesStack: true,
    //   page: const NavBar(),
    // );

    navigate(
      context: context,
      isFade: true,
      clearPagesStack: true,
      page: BlocProvider(
        create: (context) => AddBrandsBloc()..add(GetBrands()),
        child: const AddBrandsPage(),
      ),
    );
  }

  void _changeLang() {
    if (context.locale.languageCode == 'en') {
      context.setLocale(const Locale('ar', 'JO'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
  }
}
