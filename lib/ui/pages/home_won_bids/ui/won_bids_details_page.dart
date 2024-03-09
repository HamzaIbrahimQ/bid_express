
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/bids_models/history_bid_model.dart';
import 'package:bid_express/models/data_models/bids_models/won_bid_model.dart';
import 'package:bid_express/models/data_models/profile_model.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/order_at_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/order_was_rated_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/rate_info_profile_widget.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/widgets/seller_confirmed_at_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WonBidsDetailsPage extends StatefulWidget {
  final WonBidModel wonBidModel;


  const WonBidsDetailsPage({super.key, required this.wonBidModel ,
  });

  @override
  State<WonBidsDetailsPage> createState() =>
      _WonBidsDetailsPageState();
}

class _WonBidsDetailsPageState extends State<WonBidsDetailsPage>
    with Utility, UiUtility {


  List<int> starsList = [0, 1, 2, 3, 4];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(
        context: context,
        hasBackIcon: true,
        title: 'Order details',
        titleColor: Colors.white,
        backArrowColor: Colors.white,
        appBarColor: secondaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(
                start: 22.w, end: 16.w, bottom: 16.h),
            width: 1.sw,
            // height: 168.h,
            color: secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'order'.tr() + ' #',
                              style: TextStyle(
                                color: fadeTextColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:

                                  '${widget.wonBidModel?.orderID ??''}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = () {
                                  //     // navigate to desired screen
                                  //   }
                                )
                              ]),
                        ),
                        4.verticalSpace,
                        Text(
                          createTitleString(widget.wonBidModel.carParts ),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          maxLines: 2,
                        ),
                        Text(
                          '${widget.wonBidModel.carName} (${widget.wonBidModel.carYear})',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${DateFormat('MMM d,yyyy').format(widget.wonBidModel.timaDate)}' +
                              '  ' +
                              '${DateFormat.jm().format(widget.wonBidModel.timaDate)}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        8.verticalSpace,
                        Text(
                          ' \$ ${widget.wonBidModel.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                width: 1.sw,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RateInfoProfileWidget(
                        profileModel:
                        ProfileModel(imaPath: 'https://picsum.photos/200' ,
                        fName: 'Hamza' , lName:  'Qabara' ,
                        phoneNumber: '962799867585'),
                      ),

                      24.verticalSpace,
                      OrderAtWidget(buyerString: 'Adam', carString: widget.wonBidModel.carName, carYear: widget.wonBidModel.carYear, deliveryString: 'Amman - Jordan', orderAtDate: widget.wonBidModel.timaDate),
                      SellerConfirmedAtWidget(isRated: false, timeConfirmed: widget.wonBidModel.timaDate, locationSeller: 'Amman Jordan', price: widget.wonBidModel.price, sellerFName: 'Hamza', sellerLName: 'Qabara'),
                      OrderRatedWidget(isRated: false, timeRated: widget.wonBidModel.timaDate),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
