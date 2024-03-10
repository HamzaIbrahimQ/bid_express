
import 'package:bid_express/components/colors.dart';
 import 'package:bid_express/models/data_models/bids_models/won_bid_model.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/won_bids_details_page.dart';
import 'package:bid_express/ui/widgets/cached_image.dart';
 import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class BidWonWidget extends StatefulWidget {
  final WonBidModel wonBidModel;

  const BidWonWidget({super.key, required this.wonBidModel});

  @override
  State<BidWonWidget> createState() => _BidWonWidgetState();
}

class _BidWonWidgetState extends State<BidWonWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      margin: EdgeInsets.only(
          right: 24.w , left: 24.w ,
        bottom: 16.h
      ),

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.01),
            spreadRadius: .1,
            blurRadius: 5,
          ),
          BoxShadow(
            offset: const Offset(0, 7),
            color: Colors.black.withOpacity(0.01),
            spreadRadius: 5,
            blurRadius: 5,
          ),
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: .1,
            blurRadius: 5,
          ),
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: .1,
            blurRadius: 5,
          ),
        ],

        color:
        Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r) , topRight: Radius.circular(6.r)
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => _navigateToBidWonPage(context, widget.wonBidModel),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.r) , topRight: Radius.circular(6.r)
            ),
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            child: Container(
              width: 325.w,
              // margin: EdgeInsets.only(bottom: 16.h  ,
              //     right: 24.w , left: 24.w
              // ),
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 14.w,
                top: 6.h,
                bottom: 13.h,
              ),
              decoration: BoxDecoration(
                color:
                Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.r) , topRight: Radius.circular(6.r)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        12.verticalSpace,
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
                                  text: '${widget.wonBidModel.orderID}',
                                  style: TextStyle(
                                      color: blackColor,
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
                        6.verticalSpace,
                      ] +
                          (widget.wonBidModel.carParts
                              .map(
                                (e) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  e ?? '',
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: blackColor),
                                ),
                                2.verticalSpace
                              ],
                            ),
                          )
                              .toList() ??
                              []) +
                          <Widget>[
                            Text(
                              '${widget.wonBidModel.carName} (${widget.wonBidModel.carYear})',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: blackColor),
                            ),
                          ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      12.verticalSpace,
                      Text(
                        '${DateFormat('MMM d,yyyy').format(widget.wonBidModel.timaDate)}' +
                            '  ' +
                            '${DateFormat.jm().format(widget.wonBidModel.timaDate)}',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w500),
                      ),
                      (16 + widget.wonBidModel.carParts.length*6).verticalSpace,
                      Text(
                        ' \$ 0${widget.wonBidModel.price.toStringAsFixed(0)}',
                        style: TextStyle(
                            color: const Color(0xFF2D3D5E),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Container(

            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,
            vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6.r) , bottomLeft: Radius.circular(6.r)
                ),
                color: primaryColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedImageWidget(height: 48.w, width: 48.w, imgPath: widget.wonBidModel.image) ,
                12.horizontalSpace ,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.wonBidModel.name
 ,style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    ) ,
                     Text(
                      'Phone: ${widget.wonBidModel.phoneNumber}'
 ,style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    ) ,
                  ],
                ) ,
                Expanded(child: SizedBox(height: 1,)) ,
                InkWell(
                  child: SvgPicture.asset('assets/icons/call.svg' ,
                  width:22.w ,height: 22.w,),
                  onTap: ()async{
                   await  _call(widget.wonBidModel.phoneNumber);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToBidWonPage(
      BuildContext context, WonBidModel bidModel) {
    navigate(
        context: context,
        page: WonBidsDetailsPage(wonBidModel: bidModel),
        duration: const Duration(milliseconds: 300));
  }

  Future<void> _call(String number) async {
    if (await canLaunchUrl(Uri.parse('tel://$number'))) {
      await launchUrl(Uri.parse('tel://$number'));
    } else {
      throw 'Could not launch ${Uri.parse('tel://$number')}';
    }

  }
}
