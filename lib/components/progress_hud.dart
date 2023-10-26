// Flutter imports:
import 'package:bid_express/components/LoadingSpinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingView {
  static LoadingView shared = LoadingView();
  late BuildContext context;

  void startLoading(BuildContext context) {
    LoadingView.shared.context = context;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const LoadingSpinner(),
        );
      },
    );
  }

  void stopLoading() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
