import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/models/data_models/address/address.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/ui/pages/addresses/ui/edit_address.dart';
import 'package:bid_express/ui/pages/make_bid/ui/make_bid-page.dart';
import 'package:bid_express/ui/widgets/popup_menu_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatefulWidget {
  final Address address;

  const AddressWidget({super.key, required this.address});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      margin: EdgeInsets.only(
        bottom: 16.h,
        // right: 24.w , left: 24.w
      ),
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.address.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: secondaryColor),
                  ),
                  4.verticalSpace,
                  Text(
                    '${widget.address.street ?? widget.address.area ?? ''} ,${widget.address.city ?? ''}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        color: secondaryColor),
                  ),
                ]),
          ),
          Container(
            width: 24.w,
            child: PopupMenuWidget(
              firstActionTitle: 'edit'.tr(),
              secondActionTitle: 'delete'.tr(),
              firstSVG: 'assets/icons/edit.svg',
              secondSVG: 'assets/icons/delete.svg',
              firstAction: () {
                _navigateToEditAddressPage(context, widget.address);
              },
              secondAction: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToEditAddressPage(BuildContext context, Address address) {
    navigate(
        context: context,
        page: EditAddressPage(address: address),
        duration: const Duration(milliseconds: 300));
  }
}
