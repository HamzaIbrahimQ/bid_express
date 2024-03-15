import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/addresses/ui/add_address.dart';
import 'package:bid_express/ui/pages/addresses/ui/widgets/address_widget.dart';
import 'package:bid_express/ui/pages/signup/ui/widgets/section_title.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> with UiUtility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'Address',
        hasBackIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: tData.addresses
                    .map((e) => AddressWidget(address: e))
                    .toList(),
              ),
              16.verticalSpace,
              SizedBox(
                width: 325.w,
                height: 56.h,
                child: InkWell(
                  splashColor: primaryColor.withOpacity(.05),
                  highlightColor: primaryColor.withOpacity(.05),
                  borderRadius: BorderRadius.circular(6.r),
                  onTap: () {
                    _goToNewAddress(context);
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(6.r),
                    dashPattern: const [6, 6],
                    color: const Color(0xFF0057B8),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/add_plus.svg',
                            width: 20.w,
                            height: 20.h,
                            fit: BoxFit.cover,
                          ),
                          12.horizontalSpace,
                          Text(
                            'newAddress'.tr(),
                            style: TextStyle(
                                color: const Color(0xFF0057B8),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              16.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  void _goToNewAddress(BuildContext context) {
    navigate(
        context: context,
        page: const AddAddressPage(),
        duration: const Duration(milliseconds: 300));
  }
}
