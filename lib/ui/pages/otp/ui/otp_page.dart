import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/ui/pages/otp/ui/widgets/otp_page_message.dart';
import 'package:bid_express/ui/pages/otp/ui/widgets/otp_timer.dart';
import 'package:bid_express/ui/pages/otp/ui/widgets/resend_code.dart';
import 'package:bid_express/ui/pages/signup/bloc/signup_bloc.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  final String mobileNumber;
  final String password;

  const OtpPage({required this.mobileNumber, required this.password});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with UiUtility {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool _showTimer = false;
  bool _isResendButtonDeactivated = false;
  int _resentTime = 0;
  late SignupBloc _signupBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _signupBloc = context.read<SignupBloc>();
    return Scaffold(
      appBar: getAppBar(
        context: context,
        hasBackIcon: true,
        title: 'OTP Verification',
      ),
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {},
        // listener: (context, state) {
        //   if (state is VerifyUserLoadingState) {
        //     ProgressHud.shared.startLoading(context);
        //   }
        //
        //   if (state is UserVerifiedSuccessfullyState) {
        //     ProgressHud.shared.stopLoading();
        //     // _navigateToInfoMessagePage();
        //     showSuccessToast(context: context, msg: 'Verified Successfully');
        //     _navigateToHomePage();
        //   }
        //
        //   if (state is VerificationErrorState) {
        //     ProgressHud.shared.stopLoading();
        //     showErrorToast(context: context, msg: state.error);
        //   }
        //
        //   if (state is VerificationFailureState) {
        //     ProgressHud.shared.stopLoading();
        //     showErrorToast(
        //         context: context, msg: 'Check your internet connection');
        //   }
        //
        //   if (state is ResendOtpLoadingState) {
        //     ProgressHud.shared.startLoading(context);
        //   }
        //
        //   if (state is OtpResentSuccessfullyState) {
        //     ProgressHud.shared.stopLoading();
        //     setState(() {
        //       _showTimer = false;
        //       _resentTime++;
        //     });
        //     showSuccessToast(
        //         context: context,
        //         msg: state.message ?? 'Code sent successfully');
        //   }
        //
        //   if (state is ResendOtpErrorState) {
        //     ProgressHud.shared.stopLoading();
        //     showErrorToast(context: context, msg: state.error);
        //   }
        //
        //   if (state is ResendOtpFailureState) {
        //     ProgressHud.shared.stopLoading();
        //     showErrorToast(
        //         context: context, msg: 'Check your internet connection');
        //   }
        // },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  .1.sh.verticalSpace,

                  /// Message
                  const OtpPageMessage(),

                  32.verticalSpace,

                  /// Timer
                  if (!_showTimer) OtpTimer(
                    showTimer: _showTimer,
                    onFinished: () async => setState(() => _showTimer = true),
                  ),

                  32.verticalSpace,

                  /// otp fields
                  Form(
                    key: _formKey,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        appContext: context,
                        controller: _otpController,
                        autoDisposeControllers: false,
                        hintCharacter: '-',
                        hintStyle: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textStyle: TextStyle(
                          color: primaryColor.withOpacity(.8),
                          fontWeight: FontWeight.w400,
                        ),
                        length: 5,
                        obscureText: false,
                        cursorWidth: 4.w,
                        cursorHeight: 1.h,
                        cursorColor: primaryColor.withOpacity(.5),
                        animationType: AnimationType.scale,
                        errorTextSpace: 24.w,
                        // errorTextDirection: AppModel.shared.isArabic()
                        //     ? TextDirection.rtl
                        //     : TextDirection.ltr,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderWidth: .5,
                          inactiveBorderWidth: .5,
                          activeBorderWidth: .5,
                          selectedBorderWidth: 1.2,
                          fieldWidth: 48.w,
                          borderRadius: BorderRadius.circular(6),
                          selectedFillColor: primaryColor.withOpacity(.5),
                          selectedColor: primaryColor,
                          activeColor: greyColor,
                          inactiveColor: greyColor,
                        ),
                        autovalidateMode: AutovalidateMode.disabled,
                        animationDuration: const Duration(milliseconds: 300),
                        validator: (value) {
                          if (value?.isEmpty ??
                              false || (value?.length ?? 0) < 5) {
                            return 'Enter a valid verification code';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          // _signupBloc.verifyUserRequest = VerifyUserRequest(
                          //   password: widget.password,
                          //   otp: _otpController.text,
                          // );
                        },
                        onChanged: (String value) {},
                        onCompleted: (val) => _onOtpSubmitted(),
                        onSubmitted: (val) => _onOtpSubmitted(),
                      ),
                    ),
                  ),

                  14.verticalSpace,

                  /// Resend
                  ResendCode(
                    isResendButtonDeactivated: _isResendButtonDeactivated,
                    onPressed: _onResendPressed,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (MediaQuery.of(context).viewInsets.bottom != 0)
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MainButton(
                title: 'Submit',
                onTap: () => _onOtpSubmitted(),
              ),
            ),
    );
  }

  void _callVerifyUserApi() {
    // BlocProvider.of<SignupBloc>(context).add(
    //   VerifyUser(),
    // );
  }

  void _onOtpSubmitted() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    } else {
      _formKey.currentState?.save();
      _callVerifyUserApi();
    }
  }

  void _resendOtp() {
    // BlocProvider.of<SignupBloc>(context).add(ResendOtp(
    //     resendOtpRequest: ResendOtpRequest(mobileNumber: widget.mobileNumber)));
  }

  void _navigateToHomePage() {
    // navigate(
    //   context: context,
    //   isFromBottom: true,
    //   clearPagesStack: true,
    //   duration: const Duration(milliseconds: 0),
    //   page: const BottomNavBar(),
    // );
  }

  void _onResendPressed() {
    if (_resentTime >= 5) {
      showErrorToast(
        context: context,
        msg: 'Sorry, you can\'t '
            'request for new OTP '
            'code more than 5 times!',
      );
      setState(() {
        _isResendButtonDeactivated = true;
      });
      return;
    }
    _resendOtp();
  }
}
