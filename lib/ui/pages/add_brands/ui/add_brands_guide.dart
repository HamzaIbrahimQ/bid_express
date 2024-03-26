import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/add_brands.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBrandsGuide extends StatelessWidget with UiUtility {
  const AddBrandsGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'Add Cars',
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 32.h,
          start: 16.w,
          end: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Circular image
            CircleAvatar(
              backgroundImage: const AssetImage('assets/imgs/add_car_bg.png'),
              radius: 180.r,
            ),

            32.verticalSpace,

            /// Add car title
            Text(
              'Add the cars you would like to receive orders for!',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            12.verticalSpace,

            /// Add car description
            AutoSizeText(
              'Before using the application, we offer you a simple procedure '
              'for adding a car. '
              'This will allow you to automatically see the results for '
              'your car',
              maxLines: 8,
              minFontSize: 9,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            12.verticalSpace,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MainButton(
                title: 'Add Cars',
                onTap: () => _goToAddCar(context),
              ),
            ),
    );
  }

  void _goToAddCar(BuildContext context) {
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
