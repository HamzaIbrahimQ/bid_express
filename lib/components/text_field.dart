import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final TextEditingController controller;
  final String? hint;
  final Color? hintTextColor;
  final TextStyle? hintTextStyle;
  final String? label;
  final bool? isCenter;
  final bool? isPassword;
  bool? isObscure;
  final bool? isName;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final int? minLines;
  final bool? hasShadow;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool? enabled;
  final GestureTapCallback? onPrefixTapped;
  final EdgeInsetsGeometry? customContentPadding;
  final bool? isJustDigits;
  final String? errorMsg;
  final bool? isReadOnly;
  final int? maxLength;
  final String? prefixText;
  final bool? isMobileNumber;
  final TextDirection? textDirection;
  final bool? isRequired;
  final RegExp? regex;
  final double? borderRadius;
  final bool? closeOnTapOutside;
  final VoidCallback? onPasswordIconPressed;
  final List<TextInputFormatter>? inputFormatters;

  AppTextField({
    this.title,
    this.titleColor,
    this.focusNode,
    required this.controller,
    this.hint,
    this.hintTextColor,
    this.hintTextStyle,
    this.label,
    this.isCenter,
    this.isPassword,
    this.isObscure,
    this.isName,
    this.validator,
    this.textInputAction,
    this.inputType,
    this.onTap,
    this.onChange,
    this.onSubmit,
    this.onSaved,
    this.onEditingComplete,
    this.maxLines,
    this.minLines,
    this.hasShadow,
    this.prefixWidget,
    this.suffixWidget,
    this.enabled,
    this.onPrefixTapped,
    this.customContentPadding,
    this.isJustDigits,
    this.errorMsg,
    this.isReadOnly,
    this.maxLength,
    this.prefixText,
    this.isMobileNumber,
    this.textDirection,
    this.isRequired = true,
    this.regex,
    this.borderRadius,
    this.closeOnTapOutside,
    this.onPasswordIconPressed,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        elevation: (hasShadow ?? false) ? 20 : 0,
        shadowColor: const Color(0xFFB5B5B5).withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title?.isNotEmpty ?? false)
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: titleColor ?? greyColor,
                      fontSize: 10.sp,
                    ),
              ),
            if (title?.isNotEmpty ?? false) 6.verticalSpace,
            StatefulBuilder(builder: (context, setState) {
              return TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller,
                onTapOutside: (v) {
                  if (closeOnTapOutside ?? false) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                textDirection: textDirection,
                scrollPhysics: const BouncingScrollPhysics(),
                focusNode: focusNode,
                readOnly: isReadOnly ?? false,
                keyboardType: inputType ?? TextInputType.text,
                textInputAction: textInputAction ?? TextInputAction.next,
                obscureText: isObscure ?? false,
                textCapitalization: isName ?? false
                    ? TextCapitalization.words
                    : TextCapitalization.none,
                onTap: onTap,
                onChanged: (val) {
                  if (val.startsWith(' ')) {
                    controller.text = controller.text.trim();
                  }
                  if (val.contains(' ') && (isPassword ?? false)) {
                    controller.text = controller.text.trim();
                  }
                  if (onChange != null) {
                    onChange!(val);
                  }
                },
                onFieldSubmitted: onSubmit,
                onEditingComplete: onEditingComplete,
                onSaved: onSaved,
                maxLines: isPassword ?? false ? 1 : null,
                minLines: minLines ?? 1,
                maxLength: maxLength ??
                    (maxLines != null
                        ? 250
                        : (isMobileNumber ?? false)
                            ? 15
                            : (maxLength ?? 28)),
                enabled: enabled ?? true,
                textAlign:
                    isCenter ?? false ? TextAlign.center : TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: textFieldColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hint,
                  hintMaxLines: 3,
                  label: (label?.isNotEmpty ?? false)
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: controller.text.isNotEmpty ? 24.h : 0),
                          child: Text(
                            label ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: disabledColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        )
                      : null,
                  errorMaxLines: 3,
                  contentPadding: customContentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: (label?.isNotEmpty ?? false) ? 24.h : 16.h,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 6),
                    borderSide: const BorderSide(
                      color: greyColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 6),
                    borderSide: const BorderSide(
                      color: greyColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 6),
                    borderSide: const BorderSide(
                      color: greyColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 6),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 6),
                    borderSide: const BorderSide(
                      color: greyColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  errorText: errorMsg,
                  prefixText: textDirection == null ? prefixText : null,
                  suffixText:
                      textDirection == TextDirection.ltr ? prefixText : null,
                  prefixStyle: Theme.of(context).textTheme.labelMedium,
                  suffixStyle: Theme.of(context).textTheme.labelMedium,
                  counterText: '',
                  counter: const SizedBox(
                    width: 0,
                    height: 0,
                  ),
                  hintStyle: hintTextStyle ?? Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: hintTextColor ?? secondaryColor,
                      fontSize: hintTextColor != null ? 11.sp : 11.sp),
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.red),
                  suffixIcon: (suffixWidget != null)
                      ? suffixWidget
                      : (isPassword ?? false)
                          ? IconButton(
                              highlightColor: Colors.white.withOpacity(0.0),
                              splashColor: Colors.white.withOpacity(0.0),
                              icon: isObscure ?? false
                                  ? SvgPicture.asset(
                                      'assets/icons/show_pass.svg',
                                      width: 24.w,
                                      height: 15.h,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/show_pass.svg',
                                      width: 24.w,
                                      height: 15.h,
                                    ),
                              onPressed: () => setState(
                                  () => isObscure = !(isObscure ?? false)),
                            )
                          : null,
                  prefixIcon: (prefixWidget != null) ? prefixWidget : null,
                ),
                inputFormatters: (isMobileNumber ?? false)
                    ? [
                        FilteringTextInputFormatter.digitsOnly,
                      ]
                    : (isJustDigits ?? false)
                        ? [
                            FilteringTextInputFormatter.digitsOnly,
                            // FilteringTextInputFormatter.deny(
                            //   RegExp(r'^0+'),
                            // )
                          ]
                        : inputFormatters?.isNotEmpty ?? false
                            ? inputFormatters
                            : null,
                validator: validator ??
                    (value) {
                      if ((value?.trim().isEmpty ?? false) &&
                          (isRequired ?? false)) {
                        return 'This field is required';
                      } else if (((isRequired ?? false) ||
                              controller.text.isNotEmpty) &&
                          (_getRegex() != null) &&
                          (!_getRegex()!.hasMatch(value ?? ''))) {
                        return (isPassword ?? false)
                            ? 'one uppercase letter, one lowercase letter, '
                                'one digit,'
                                ' one special character, '
                                '8 characters, no spaces'
                            : 'Invalid input';
                      } else {
                        return null;
                      }
                    },
              );
            }),
          ],
        ),
      ),
    );
  }

  RegExp? _getRegex() {
    return (isPassword ?? false) ? passwordRegex : regex;
  }
}
