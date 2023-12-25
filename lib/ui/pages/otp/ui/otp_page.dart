import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/models/requests/signup/signup_request.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/add_brands.dart';
import 'package:bid_express/ui/pages/login/bloc/login_bloc.dart';
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
  final bool? isSignup;
  final SignupRequest? signupRequest;

  const OtpPage({
    required this.mobileNumber,
    required this.password,
    this.isSignup,
    this.signupRequest,
  });

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
    if (widget.signupRequest != null) {
      context.read<SignupBloc>().signupRequest = widget.signupRequest!;
    }
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
        listener: (context, state) {
          if (state is ReSendOtpLoadingState) {
            LoadingView.shared.startLoading(context);
          }

          if (state is ReSendOtpSuccessState) {
            LoadingView.shared.stopLoading();
            setState(() {
              _showTimer = false;
              _resentTime++;
            });
            showSuccessToast(context: context, msg: 'Code sent successfully');
          }

          if (state is ReSendOtpErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context, msg: state.error);
          }

          if (state is ReSendOtpFailureState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context);
          }

          if (state is SignupLoadingState) {
            LoadingView.shared.startLoading(context);
          }
          if (state is SignupSuccessState) {
            LoadingView.shared.stopLoading();
            context.read<LoginBloc>().loginRequest.userName = widget.signupRequest?.userName;
            context.read<LoginBloc>().loginRequest.password = widget.signupRequest?.password;
            context.read<LoginBloc>().add(Login());
          }
          if (state is SignupErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context, msg: state.error);
          }
          if (state is SignupFailureState) {
            showErrorToast(context: context);
          }
        },
        builder: (context, state) {
          return BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                LoadingView.shared.startLoading(context);
              }

              if (state is LoginSuccessState) {
                LoadingView.shared.stopLoading();
                _goToAddBrands();
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
            child: SingleChildScrollView(
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
                    if (!_showTimer)
                      OtpTimer(
                        showTimer: _showTimer,
                        onFinished: () async =>
                            setState(() => _showTimer = true),
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
                    Visibility(
                      visible: _showTimer,
                      child: ResendCode(
                        isResendButtonDeactivated: _isResendButtonDeactivated,
                        onPressed: _onResendPressed,
                      ),
                    ),
                  ],
                ),
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

  void _onOtpSubmitted() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    } else {
      _formKey.currentState?.save();
      if (widget.isSignup ?? false) {
        _signupBloc.signupRequest.otpCode = _otpController.text.trim();
        _signupBloc.add(Signup());
      }
    }
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
    if (widget.isSignup ?? false) {
      _signupBloc.add(ReSendOtp());
    }
  }

  void _goToAddBrands() {
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
}
