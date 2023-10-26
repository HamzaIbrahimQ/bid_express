import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/responses/location_data/location_data.dart';
import 'package:bid_express/ui/pages/select_location/cubit/select_location_cubit.dart';
import 'package:bid_express/ui/pages/select_location/ui/select_location_page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetLocationOnMap extends StatelessWidget with UiUtility {
  final Function(LocationData data) onData;
   SetLocationOnMap({required this.onData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Set Location On The Map',
            style: TextStyle(fontSize: 12.sp),
          ),
          InkWell(
            onTap: () => _goToMapPage(context),
            borderRadius: BorderRadius.circular(6.r),
            overlayColor: MaterialStatePropertyAll(
              primaryColor.withOpacity(.1),
            ),
            child: Ink(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F6FB),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: SvgPicture.asset('assets/icons/location_marker.svg'),
            ),
          ),
        ],
      ),
    );
  }

  void _goToMapPage(BuildContext context) {
    navigate(
      context: context,
      page: BlocProvider(
        create: (context) => SelectLocationCubit()..checkLocationPermission(),
        child: const SelectLocationPage(),
      ),
      then: (val) {
        if (val != null) {
          val as LocationData;
          onData(val);
        }
      }
    );
  }
}
