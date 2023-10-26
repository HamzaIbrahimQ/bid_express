import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendCode extends StatelessWidget {
  final bool isResendButtonDeactivated;
  final VoidCallback? onPressed;
  const ResendCode({required this.isResendButtonDeactivated, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Resend message
        Text('Don\'t Receive Your Code?',
            style: TextStyle(
              fontSize: 13.sp,
              color: secondaryColor,
            )
          // Theme.of(context)
          //       .textTheme
          //       .labelSmall
          //       ?.copyWith(color: textFieldColor),
        ),

        /// Resend button
        TextButton(
          child: Text('Resend Code',
              style: TextStyle(
                fontSize: 13.sp,
                color: isResendButtonDeactivated
                    ? disabledColor
                    : textFieldColor,
                fontWeight: FontWeight.w500,
              )
            // Theme.of(context).textTheme.labelSmall?.copyWith(
            //       color: _isResendButtonDeactivated
            //           ? disabledColor
            //           : textFieldColor,
            //       fontWeight: FontWeight.bold,
            //     ),
          ),
          style: Theme.of(context)
              .textButtonTheme
              .style
              ?.copyWith(alignment: Alignment.topCenter),
          onPressed: onPressed
        ),
      ],
    );
  }
}
