 import 'package:bid_express/components/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderRatedWidget extends StatelessWidget {
  final bool isRated ;
  final DateTime timeRated ;

  const OrderRatedWidget({super.key ,
  required this.isRated ,
  required this.timeRated ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 40.h,

      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.sp)),
                color:
                isRated  ?
                primaryColor : const Color(0xFFE4EDF7)
            ),
            alignment: Alignment.center,
            child:
            isRated ?

            Icon(Icons.done ,
              size: 16.sp,
              color: Colors.white,):SizedBox(width: 1,height: 1,),
          ) ,
          10.horizontalSpace ,
          Text(
            isRated?
            ('orderWasRated'.tr()+' ' +
                ' ${DateFormat('MMM d,yyyy').format(timeRated)}'
                + '  ' + '${DateFormat.jm().format(timeRated)}' )    :
                'orderWasNotRated'.tr()
            ,  style: TextStyle(
              color: secondaryColor ,
              fontWeight: FontWeight.bold ,
              fontSize: 12.sp,
              fontFamily: 'Montserrat'
          ),)

        ],
      ),
    );
  }
}
