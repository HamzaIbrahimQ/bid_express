
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderAtWidget extends StatelessWidget with Utility , UiUtility {
 final  String buyerString;
 final  String carString;
 final  String carYear;
 final  String deliveryString;
 final  DateTime orderAtDate;
  const OrderAtWidget({super.key ,
  required this.buyerString ,
  required this.carString ,
  required this.carYear ,
  required this.deliveryString ,
  required this.orderAtDate ,
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
          color: primaryColor,
         )
        ],
       ) ,
       10.horizontalSpace ,
       Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
         Text('orderedAt'.tr() + ' ${DateFormat('MMM d,yyyy').format(orderAtDate)}' + '  ' + '${DateFormat.jm().format(orderAtDate)}' ,
         style: TextStyle(
          color: secondaryColor ,
          fontWeight: FontWeight.bold ,
          fontSize: 12.sp,
          fontFamily: 'Montserrat'
         ),) ,
         16.verticalSpace,
         RichText(
          text: TextSpan(
              text: 'buyer'.tr() + ': ',
              style: TextStyle(
               color: secondaryColor,
               fontSize: 12.sp,
               fontWeight: FontWeight.bold,
               fontFamily: 'Montserrat',
              ),
              children: <TextSpan>[
               TextSpan(
                text: '${buyerString}',
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
              text: 'car'.tr() + ': ',
              style: TextStyle(
               color: secondaryColor,
               fontSize: 12.sp,
               fontWeight: FontWeight.bold,
               fontFamily: 'Montserrat',
              ),
              children: <TextSpan>[
               TextSpan(
                text: '${carString} (${carYear})',
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
              text: 'delivery'.tr() + ': ',
              style: TextStyle(
               color: secondaryColor,
               fontSize: 12.sp,
               fontWeight: FontWeight.bold,
               fontFamily: 'Montserrat',
              ),
              children: <TextSpan>[
               TextSpan(
                text: deliveryString,
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
