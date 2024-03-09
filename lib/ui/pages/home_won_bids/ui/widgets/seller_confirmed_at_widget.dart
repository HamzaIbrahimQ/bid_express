 import 'package:bid_express/components/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerConfirmedAtWidget extends StatelessWidget {

 final bool isRated ;
 final DateTime timeConfirmed ;
 final String locationSeller ;
 final double price ;
 final String sellerFName ;
 final String sellerLName ;

  const SellerConfirmedAtWidget({super.key ,
  required this.isRated ,
  required this.timeConfirmed ,
  required this.locationSeller ,
  required this.price,
  required this.sellerFName,
  required this.sellerLName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 120.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.sp)),
                    color: primaryColor
                ),
                alignment: Alignment.center,
                child: Icon(Icons.done ,
                  size: 16.sp,
                  color: Colors.white,),
              ) ,
              4.verticalSpace,
              Container(
                height: 90.h,
                width: 1.5.w,
                color:isRated?
                primaryColor : const Color(0xFFE4EDF7),
              )
            ],
          ) ,
          10.horizontalSpace ,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text('sellerConfirmed'.tr() +
                  ' ${DateFormat('MMM d,yyyy').format(timeConfirmed)}'
                  + '  ' + '${DateFormat.jm().format(timeConfirmed)}' ,
                style: TextStyle(
                    color: secondaryColor ,
                    fontWeight: FontWeight.bold ,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat'
                ),) ,
              16.verticalSpace,
              RichText(
                text: TextSpan(
                    text: 'seller'.tr() + ': ',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '$sellerFName $sellerLName',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     // navigate to desired screen
                        //   }
                      )
                    ]),
              ),
              12.verticalSpace,
              RichText(
                text: TextSpan(
                    text: 'From'.tr() + ': ',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: locationSeller,
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     // navigate to desired screen
                        //   }
                      )
                    ]),
              ),
              12.verticalSpace,

              RichText(
                text: TextSpan(
                    text: 'priceBid'.tr() + ': ',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\$$price',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     // navigate to desired screen
                        //   }
                      )
                    ]),
              ),
            ],
          )
        ],
      ),
    );

  }
}
