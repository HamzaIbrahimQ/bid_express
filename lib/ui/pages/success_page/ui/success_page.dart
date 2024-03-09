import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/colors.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> with UiUtility , Utility{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: getAppBar(context: context, title: 'Congrats!' ,
     hasBackIcon: true ,
       appBarColor: secondaryColor ,
       titleColor: Colors.white
     ),
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 1,height: 1,) ,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Your Order Has been Done Successfully' ,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: blackColor), ) , 
              16.verticalSpace , 
              SvgPicture.asset('assets/icons/done.svg' ,
              height: 40,width: 40,)
            ],
            
          ) , 
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w , vertical: 20.h),
            child: MainButton(title: 'Done', onTap: () {

            }),
          )
        ],
      ),
    );
  }
}
