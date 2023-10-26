import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpTimer extends StatelessWidget {
  final bool showTimer;
  final Function? onFinished;

  const OtpTimer({required this.showTimer, this.onFinished});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Resend code in
        Text('Request New Code in:',
            style: TextStyle(
              fontSize: 13.sp,
              color: secondaryColor,
            )

            // Theme.of(context)
            //     .textTheme
            //     .labelSmall
            //     ?.copyWith(color: textFieldColor),
            ),
        8.verticalSpace,

        /// Timer
        Countdown(
          seconds: 60,
          build: (BuildContext context, double time) => Text(
              ' 00:' + time.toString().split('.').first,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: secondaryColor,
                  fontWeight: FontWeight.w500)
              // Theme.of(context)
              //     .textTheme
              //     .bodyLarge
              //     ?.copyWith(color: textFieldColor),
              ),
          interval: const Duration(seconds: 1),
          onFinished: onFinished,
        ),
      ],
    );
  }
}
