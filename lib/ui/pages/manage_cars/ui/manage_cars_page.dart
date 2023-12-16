import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/bloc/home_bloc.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageCarsPage extends StatefulWidget {
  const ManageCarsPage({super.key});

  @override
  State<ManageCarsPage> createState() => _ManageCarsPageState();
}

class _ManageCarsPageState extends State<ManageCarsPage> with UiUtility {
  late Future<String> future;

  @override
  void initState() {
    super.initState();
    future = context.read<HomeBloc>().getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ManageCarsBloc, ManageCarsState>(
        listener: (context, state) {
          if (state is GetCarsLoadingState) {
            LoadingView.shared.startLoading(context);
          }

          if (state is GetCarsSuccessState) {
            LoadingView.shared.stopLoading();
          }

          if (state is GetCarsErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context, msg: state.error);
          }

          if (state is GetCarsFailureState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context);
          }
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              body: Stack(
                children: [
                  /// Bg and body
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Bg image and username
                      Stack(
                        children: [
                          /// Bg
                          Container(
                            width: 1.sw,
                            height: .25.sh,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/imgs/dashboard_bg.jpg',
                                ),
                              ),
                            ),
                          ),

                          /// Username
                          FutureBuilder<String>(
                            future: future,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                          ),
                        ],
                      ),
                    ],
                  ),

                  16.verticalSpace,

                  /// Cars
                  Positioned(
                    top: 170,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 24.w),
                      child: Row(
                        children: [
                          /// Car
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            margin: EdgeInsetsDirectional.only(end: 6.w),
                            padding: EdgeInsetsDirectional.only(
                              start: 15.w,
                              end: 15.w,
                              top: 15.h,
                              bottom: 7.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// Car logo
                                SvgPicture.asset(
                                  'assets/icons/toyota.svg',
                                  width: 50.w,
                                ),

                                12.verticalSpace,

                                Text(
                                  'Toyota',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            margin: EdgeInsetsDirectional.only(end: 6.w),
                            padding: EdgeInsetsDirectional.only(
                              start: 15.w,
                              end: 15.w,
                              top: 15.h,
                              bottom: 7.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// Car logo
                                SvgPicture.asset(
                                  'assets/icons/toyota.svg',
                                  width: 50.w,
                                ),

                                12.verticalSpace,

                                Text(
                                  'Nissan',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            margin: EdgeInsetsDirectional.only(end: 6.w),
                            padding: EdgeInsetsDirectional.only(
                              start: 15.w,
                              end: 15.w,
                              top: 15.h,
                              bottom: 7.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// Car logo
                                SvgPicture.asset(
                                  'assets/icons/toyota.svg',
                                  width: 50.w,
                                ),

                                12.verticalSpace,

                                Text(
                                  'Ford',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            margin: EdgeInsetsDirectional.only(end: 6.w),
                            padding: EdgeInsetsDirectional.only(
                              start: 15.w,
                              end: 15.w,
                              top: 15.h,
                              bottom: 7.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// Car logo
                                SvgPicture.asset(
                                  'assets/icons/toyota.svg',
                                  width: 50.w,
                                ),

                                12.verticalSpace,

                                Text(
                                  'Kia',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 285,
                    child: SizedBox(
                      width: 1.sw,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            /// Car
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 24.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                margin: EdgeInsetsDirectional.only(end: 6.w),
                                padding: EdgeInsetsDirectional.only(
                                  start: 23.w,
                                  end: 23.w,
                                  top: 10.h,
                                  bottom: 10.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Camry',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              margin: EdgeInsetsDirectional.only(end: 6.w),
                              padding: EdgeInsetsDirectional.only(
                                start: 23.w,
                                end: 23.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Corolla',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              margin: EdgeInsetsDirectional.only(end: 6.w),
                              padding: EdgeInsetsDirectional.only(
                                start: 23.w,
                                end: 23.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Prius',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              margin: EdgeInsetsDirectional.only(end: 6.w),
                              padding: EdgeInsetsDirectional.only(
                                start: 23.w,
                                end: 23.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Prius',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              margin: EdgeInsetsDirectional.only(end: 24.w),
                              padding: EdgeInsetsDirectional.only(
                                start: 23.w,
                                end: 23.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Land cruiser',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
