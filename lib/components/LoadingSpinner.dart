import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            'assets/lotties/loading.json',
            alignment: Alignment.center,
            width: 0.5.sw,
            height: 0.4.sw,
          ),
        ),
      ],
    );
  }
}
