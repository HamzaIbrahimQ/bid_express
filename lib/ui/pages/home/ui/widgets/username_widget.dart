import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNameWidget extends StatelessWidget {
  final Future<String> future;

  const UserNameWidget({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        } else {
          return PositionedDirectional(
            top: 60,
            end: 25,
            child: SizedBox(
              width: .5.sw,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Hi, username
                    AutoSizeText(
                      'Hi, ${snapshot.data}',
                      textAlign: TextAlign.start,
                      minFontSize: 10,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    4.verticalSpace,

                    /// Welcome back
                    AutoSizeText(
                      'Welcome back',
                      textAlign: TextAlign.start,
                      minFontSize: 8,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
