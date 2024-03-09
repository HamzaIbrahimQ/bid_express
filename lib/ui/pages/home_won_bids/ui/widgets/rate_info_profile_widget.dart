import 'package:bid_express/models/data_models/profile_model.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/home_won_bid_widget.dart';
import 'package:bid_express/ui/widgets/cached_image.dart';
import 'package:bid_express/utils/ui_utility.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RateInfoProfileWidget extends StatelessWidget with UiUtility {
  final ProfileModel profileModel;



  const RateInfoProfileWidget(
      {super.key, required this.profileModel,  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

          // _goToProfileSeller(context, sellerOfferModel);
        },
      child: Container(
        width: 1.sw,
        height: 60.h,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        color: const Color(0xFF0057B8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedImageWidget(
                    height: 48.w,
                    width: 48.w,
                    imgPath: profileModel.imaPath ?? ''),
                8.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (profileModel.fName ?? '') +
                          ' ' +
                          (profileModel.lName ?? ''),
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ('phone'.tr() +
                              ':${profileModel.phoneNumber}')
                        ,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            ),
            SvgPicture.asset(

               'assets/icons/phone.svg'
                ,
              width: 19.1.w,
              height: 19.1.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
