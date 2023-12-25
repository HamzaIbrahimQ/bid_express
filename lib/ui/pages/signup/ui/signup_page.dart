import 'dart:io';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/models/responses/location_data/location_data.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
import 'package:bid_express/ui/pages/login/ui/widgets/country_code.dart';
import 'package:bid_express/ui/pages/otp/ui/otp_page.dart';
import 'package:bid_express/ui/pages/select_location/cubit/select_location_cubit.dart';
import 'package:bid_express/ui/pages/signup/bloc/signup_bloc.dart';
import 'package:bid_express/ui/pages/signup/ui/widgets/address_title.dart';
import 'package:bid_express/ui/pages/signup/ui/widgets/set_location_on_map.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with UiUtility {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mobileFormKey = GlobalKey<FormState>();

  final TextEditingController _businessNameCont = TextEditingController();
  final FocusNode _businessNameFoc = FocusNode();

  final TextEditingController _mobileCont = TextEditingController();
  final FocusNode _mobileFoc = FocusNode();

  final TextEditingController _passCont = TextEditingController();
  final FocusNode _passFoc = FocusNode();

  final TextEditingController _confirmPassCont = TextEditingController();
  final FocusNode _confirmPassFoc = FocusNode();

  final TextEditingController _addressNameCont = TextEditingController();
  final FocusNode _addressNameFoc = FocusNode();

  final TextEditingController _cityCont = TextEditingController();
  final FocusNode _cityFoc = FocusNode();

  final TextEditingController _areaCont = TextEditingController();
  final FocusNode _areaFoc = FocusNode();

  final TextEditingController _streetCont = TextEditingController();
  final FocusNode _streetFoc = FocusNode();

  final TextEditingController _buildingCont = TextEditingController();
  final FocusNode _buildingFoc = FocusNode();

  late SignupBloc _bloc;
  late SelectLocationCubit _locationCubit;

  CountryCode countryCode = CountryCode(code: 'JO', dialCode: '962');

  XFile? _profileImg;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _businessNameCont.text = 'xyz' +
          '${DateTime.now().hour.toString()}${DateTime.now().minute.toString()}${DateTime.now().second.toString()}';
      _mobileCont.text = '789123';
      _passCont.text = 'Aa@11111';
      _confirmPassCont.text = 'Aa@11111';
      _streetCont.text = 'شارع مكه المكرمه';
    }
  }

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
    _addressNameCont.dispose();
    _addressNameFoc.dispose();
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
    _bloc = context.read<SignupBloc>();
    _locationCubit = context.read<SelectLocationCubit>();
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Sign Up', hasBackIcon: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.verticalSpace,

              /// Profile image
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 24.h),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return GestureDetector(
                      onTap: () => _pickImg(setState: setState),
                      child: SizedBox(
                        width: 108.w,
                        height: 108.h,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            /// Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: (_profileImg?.path.isNotEmpty ?? false)
                                  ? Image.file(
                                      File(_profileImg?.path ?? ''),
                                      width: 108.w,
                                      height: 108.h,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/imgs/user.png',
                                      width: 108.w,
                                      height: 108.h,
                                      fit: BoxFit.cover,
                                    ),
                            ),

                            /// Camera icon
                            PositionedDirectional(
                              bottom: -15,
                              end: -20,
                              child: GestureDetector(
                                onTap: () => _pickImg(setState: setState),
                                child: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 10),
                                        color: Colors.black.withOpacity(0.01),
                                        spreadRadius: .1,
                                        blurRadius: 5,
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 7),
                                        color: Colors.black.withOpacity(0.01),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        color: Colors.black.withOpacity(0.05),
                                        spreadRadius: .1,
                                        blurRadius: 5,
                                      ),
                                      BoxShadow(
                                        offset: const Offset(0, 3),
                                        color: Colors.black.withOpacity(0.05),
                                        spreadRadius: .1,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/camera.svg',
                                    fit: BoxFit.contain,
                                    colorFilter: const ColorFilter.mode(
                                      secondaryColor,
                                      BlendMode.srcIn,
                                    ),
                                    // width: 32.w,
                                    // height: 32.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// Form fields
              MultiBlocListener(
                listeners: [
                  BlocListener<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is SendOtpLoadingState) {
                        LoadingView.shared.startLoading(context);
                      }

                      if (state is SendOtpSuccessState) {
                        LoadingView.shared.stopLoading();
                        _goToOtpPage();
                      }

                      if (state is SendOtpErrorState) {
                        LoadingView.shared.stopLoading();
                        showErrorToast(context: context, msg: state.error);
                      }

                      if (state is SendOtpFailureState) {
                        LoadingView.shared.stopLoading();
                        showErrorToast(context: context);
                      }
                    },
                  ),
                  BlocListener<SelectLocationCubit, SelectLocationState>(
                    listener: (context, state) {
                      if (state is GetCurrentLocationSuccessState) {
                        _bloc.signupRequest.latitude =
                            _locationCubit.currentLocation.latitude;
                        _bloc.signupRequest.longitude =
                            _locationCubit.currentLocation.longitude;

                        _locationCubit.getSelectedLocationData(
                            isCurrentLocation: true);
                      }

                      if (state is GetCurrentLocationErrorState) {
                        // if (state.isService ?? false) {
                        //   LoadingView.shared.stopLoading();
                        // }
                        _showLocationPermissionError(state.isService);
                      }

                      if (state is GetSelectedLocationDataLoadingState) {
                        LoadingView.shared.startLoading(context);
                      }

                      if (state is GetSelectedLocationDataSuccessState) {
                        LoadingView.shared.stopLoading();
                        _fillLocationData(
                          _locationCubit.locationData ?? LocationData(),
                        );
                      }

                      if (state is GetSelectedLocationDataErrorState) {
                        LoadingView.shared.stopLoading();
                        showErrorToast(context: context);
                      }

                      if (state is SelectedLocationOutOfRangeState) {
                        LoadingView.shared.stopLoading();
                        showErrorToast(
                            context: context,
                            msg: 'locationOutOfRangeWarning'.tr());
                      }
                    },
                  ),
                ],
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Business name field
                        AppTextField(
                          controller: _businessNameCont,
                          focusNode: _businessNameFoc,
                          title: 'businessName'.tr(),
                          hint: 'enterYourBusinessName'.tr(),
                          inputType: TextInputType.name,
                          regex: businessNameRegex,
                          onSubmit: (v) => _mobileFoc.requestFocus(),
                          onSaved: (val) {
                            _bloc.signupRequest.name = val?.trim();
                            _bloc.signupRequest.userName = val?.trim();
                          },
                        ),

                        6.verticalSpace,

                        /// Mobile field
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
                                  hasPadding: !(_mobileFormKey.currentState
                                          ?.validate() ??
                                      false),
                                ),
                                onChange: (v) => setState(() {}),
                                inputType: TextInputType.number,
                                onSaved: (val) {
                                  _bloc.signupRequest.mobileNumber =
                                      val?.trim();
                                  _bloc.signupRequest.mobileAreaCode =
                                      countryCode.dialCode;
                                },
                              ),
                            );
                          },
                        ),

                        6.verticalSpace,

                        /// Password field
                        AppTextField(
                          controller: _passCont,
                          focusNode: _passFoc,
                          title: 'password'.tr(),
                          hint: 'enterPassword'.tr(),
                          isPassword: true,
                          isObscure: true,
                          regex: passwordRegex,
                          maxLength: 16,
                          onSubmit: (val) => _confirmPassFoc.requestFocus(),
                          onSaved: (val) =>
                              _bloc.signupRequest.password = val?.trim(),
                        ),

                        6.verticalSpace,

                        /// Confirm password field
                        AppTextField(
                          controller: _confirmPassCont,
                          focusNode: _confirmPassFoc,
                          title: 'confirmPassword'.tr(),
                          hint: 'reEnterPassword'.tr(),
                          isPassword: true,
                          isObscure: true,
                          regex: passwordRegex,
                          maxLength: 16,
                          onSubmit: (val) => _addressNameFoc.requestFocus(),
                          onSaved: (val) => {},
                          validator: (value) {
                            final regex = passwordRegex;
                            if (value?.trim().isEmpty ?? false) {
                              return '';
                            } else if (value?.trim() != _passCont.text.trim()) {
                              return 'twoPasswordsDoNotMatch'.tr();
                            } else if (!regex.hasMatch(value ?? '')) {
                              return 'passwordRules'.tr();
                            } else {
                              return null;
                            }
                          },
                        ),

                        /// Location title
                        const AddressTitle(),

                        /// Set location on map
                        SetLocationOnMap(
                          onData: (data) => _fillLocationData(data),
                        ),

                        /// Use my current location
                        SetLocationOnMap(
                          title: 'useMyCurrentLocation'.tr(),
                          onData: (data) => {},
                        ),

                        /// Location fields
                        BlocConsumer<SignupBloc, SignupState>(
                          listener: (context, state) {
                            if (state is UpdateLocationFieldsState) {}
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                /// Address name field
                                AppTextField(
                                  controller: _addressNameCont,
                                  focusNode: _addressNameFoc,
                                  title: 'addressName'.tr(),
                                  hint: 'clientsWillNotSeeYourAddressName'.tr(),
                                  inputType: TextInputType.name,
                                  regex: businessNameRegex,
                                  maxLength: 120,
                                  onSaved: (val) => _bloc
                                      .signupRequest.addressName = val?.trim(),
                                ),

                                6.verticalSpace,

                                /// City field
                                AppTextField(
                                  controller: _cityCont,
                                  focusNode: _cityFoc,
                                  title: 'city'.tr(),
                                  hint: 'locatedCity'.tr(),
                                  inputType: TextInputType.name,
                                  regex: cityNameRegex,
                                  onSaved: (val) =>
                                      _bloc.signupRequest.city = val?.trim(),
                                ),

                                6.verticalSpace,

                                /// Area field
                                AppTextField(
                                  controller: _areaCont,
                                  focusNode: _areaFoc,
                                  title: 'area'.tr(),
                                  hint: 'locatedArea'.tr(),
                                  inputType: TextInputType.name,
                                  regex: cityNameRegex,
                                  onSaved: (val) =>
                                      _bloc.signupRequest.area = val?.trim(),
                                ),

                                6.verticalSpace,

                                /// Street field
                                AppTextField(
                                  controller: _streetCont,
                                  focusNode: _streetFoc,
                                  title: 'street'.tr(),
                                  hint: 'streetNameOrNumber'.tr(),
                                  inputType: TextInputType.name,
                                  regex: businessNameRegex,
                                  onSaved: (val) =>
                                      _bloc.signupRequest.street = val?.trim(),
                                ),

                                6.verticalSpace,

                                /// Building field
                                AppTextField(
                                  controller: _buildingCont,
                                  focusNode: _buildingFoc,
                                  title: 'building'.tr(),
                                  hint: 'buildingNumber'.tr(),
                                  isRequired: false,
                                  inputType: TextInputType.name,
                                  regex: businessNameRegex,
                                  textInputAction: TextInputAction.done,
                                  onSaved: (val) => {},
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Login button
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: MainButton(
                  title: 'proceed'.tr(),
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
    final _isMobileNotValid =
        !(_mobileFormKey.currentState?.validate() ?? false);

    final _isOtherFieldsNotValid =
        !(_formKey.currentState?.validate() ?? false);
    final bool _isCoordinatesEmpty = _bloc.signupRequest.latitude == null ||
        _bloc.signupRequest.longitude == null;

    if (_isMobileNotValid || _isOtherFieldsNotValid) {
      return;
    } else {
      if (_isCoordinatesEmpty) {
        showErrorToast(
            context: context, msg: 'pleaseSelectTheBusinessLocation'.tr());
        return;
      }
      _mobileFormKey.currentState?.save();
      _formKey.currentState?.save();
      if (_profileImg != null) {
        _bloc.signupRequest.profilePictureFileBase64 = _profileImg?.path;
        _bloc.signupRequest.profilePictureFileName =
            '${_profileImg?.name}_${DateTime.now().toIso8601String()}';
      }
      if (isKeyboardOpen ?? false) {
        FocusManager.instance.primaryFocus?.unfocus();
        Future.delayed(const Duration(milliseconds: 300)).then((value) {
          _requestOtp();
        });
      } else {
        _requestOtp();
      }
    }
  }

  void _requestOtp() {
    _bloc.add(SendOtp());
  }

  void _fillLocationData(LocationData data) {
    // _addressNameCont.text = data.displayName ?? '';
    _addressNameCont.text =
        (data.addressData?.city ?? data.addressData?.state ?? '') +
            ' ' +
            (data.addressData?.suburb ??
                data.addressData?.neighbourhood ??
                data.addressData?.stateDistrict ??
                '');
    _cityCont.text = data.addressData?.city ?? data.addressData?.state ?? '';
    _areaCont.text = data.addressData?.suburb ??
        data.addressData?.neighbourhood ??
        data.addressData?.stateDistrict ??
        '';
    if (!kDebugMode) {
      _streetCont.text = data.addressData?.road ?? data.name ?? '';
    }
    _bloc.signupRequest.latitude = double.tryParse(data.lat ?? '');
    _bloc.signupRequest.longitude = double.tryParse(data.long ?? '');
    _updateFields();
  }

  void _updateFields() {
    _bloc.add(UpdateLocationFields());
  }

  void _goToOtpPage() {
    navigate(
      context: context,
      page: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(),
          ),
          BlocProvider(create: (context) => LoginBloc()),
        ],
        child: OtpPage(
          mobileNumber: _bloc.signupRequest.mobileNumber ?? '',
          password: _bloc.signupRequest.password ?? '',
          isSignup: true,
          signupRequest: _bloc.signupRequest,
        ),
      ),
    );
  }

  void _showLocationPermissionError(bool? isService) {
    showErrorToast(
        context: context,
        duration: 5,
        button: isService ?? false
            ? null
            : OutlinedButton(
                onPressed: () async => await _openSettings(),
                child: Text(
                  'openSettings'.tr(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                ),
              ),
        msg: isService ?? false
            ? 'enableLocationServiceWarning'.tr()
            : 'enableLocationPermissionWarning'.tr());
  }

  Future<void> _openSettings() async {
    await openAppSettings();
  }

  Future<void> _pickImg({
    required StateSetter setState,
    ImageSource? source,
  }) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: source ?? ImageSource.camera,
      imageQuality: 40,
    );
    if (pickedFile?.path.isNotEmpty ?? false) {
      setState(() {
        _profileImg = pickedFile;
      });
    }
  }
}
