import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/bids_models/won_bid_model.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/won_bids_details_page.dart';
import 'package:bid_express/ui/widgets/cached_image.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      margin: EdgeInsetsDirectional.only(end: 24.w, start: 24.w, bottom: 16.h),
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
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r), topRight: Radius.circular(6.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Bid content
          InkWell(
            onTap: () =>
                _navigateToBidWonPage(context, widget.wonBidModel),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.r),
              topRight: Radius.circular(6.r),
            ),
            overlayColor:
            const MaterialStatePropertyAll(Colors.transparent),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h, start: 6.w, end: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Order id and date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Order id
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
                                color: fadeTextColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                              ),
                            )
                          ],
                        ),
                      ),

                      /// date
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
                    ],
                  ),

                  6.verticalSpace,

                  /// Bid content and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// Image and parts
                      Row(
                        crossAxisAlignment: widget.wonBidModel.carParts.length > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                        children: [
                          /// Brand image
                          Padding(
                            padding: EdgeInsets.only(top: widget.wonBidModel.carParts.length > 1 ?  4.h : 0),
                            child: SvgPicture.asset(
                              'assets/icons/toyota.svg',
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                secondaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),


                          Container(
                            padding: EdgeInsetsDirectional.only(start: 12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.r),
                                topRight: Radius.circular(6.r),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget.wonBidModel.carParts
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(bottom: 2.h),
                                      child: Text(
                                        e ?? '',
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: blackColor),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),

                      /// price
                      Text(
                        ' \$${widget.wonBidModel.price.toStringAsFixed(0)}',
                        style: TextStyle(
                            color: const Color(0xFF2D3D5E),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),

                  6.verticalSpace,

                  /// Car info and price
                  Text(
                    '${widget.wonBidModel.carName} (${widget.wonBidModel.carYear})',
                    maxLines: 2,
                    style: TextStyle(
                      color: fadeTextColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Buyer profile
          Container(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6.r),
                    bottomLeft: Radius.circular(6.r)),
                color: secondaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedImageWidget(
                    height: 48.w,
                    width: 48.w,
                    imgPath: widget.wonBidModel.image),
                12.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.wonBidModel.name,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Phone: ${widget.wonBidModel.phoneNumber}',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(
                    height: 1,
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(
                    'assets/icons/call.svg',
                    width: 22.w,
                    height: 22.w,
                  ),
                  onTap: () => _call('00962772127805'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToBidWonPage(BuildContext context, WonBidModel bidModel) {
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
