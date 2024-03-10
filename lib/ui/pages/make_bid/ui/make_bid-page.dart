import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/models/data_models/picked_image_model.dart';
import 'package:bid_express/ui/pages/make_bid/ui/widgets/add_image_widget.dart';
import 'package:bid_express/ui/pages/make_bid/ui/widgets/check_box_with_title.dart';
import 'package:bid_express/ui/pages/make_bid/ui/widgets/image_widget.dart';
import 'package:bid_express/ui/pages/success_page/ui/success_page.dart';
import 'package:bid_express/ui/widgets/drop_down_range_home.dart';
import 'package:bid_express/utils/temporary_data.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class MakeBidPage extends StatefulWidget {
 final BidModel bidModel;

   const MakeBidPage({
    super.key,
    required this.bidModel,
  });

  @override
  State<MakeBidPage> createState() => _MakeBidPageState();
}

class _MakeBidPageState extends State<MakeBidPage> with UiUtility {
  final TextEditingController _detailsCont = TextEditingController();
  final TextEditingController _priceCont = TextEditingController();

  bool _isGenuine = false;
  bool _isInclude = false;
  bool _isNew = false;
  bool _isUsed = false;

  final List<PickedImageModel> _pickedImages = [];

  String _warrantyValue = '';

  @override
  void dispose() {
    _priceCont.dispose();
    _detailsCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        hasBackIcon: true,
        title: 'Make A Bid',
        titleColor: Colors.white,
        backArrowColor: Colors.white,
        appBarColor: secondaryColor,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Top image
          Container(
            padding: EdgeInsetsDirectional.only(
              start: 22.w,
              end: 16.w,
              bottom: 16.h,
            ),
            width: 1.sw,
            height: 92.h,
            color: secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                              text: '${widget.bidModel.orderID}',
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
                    Flexible(
                      child: AutoSizeText(
                        createTitleString(widget.bidModel.carParts),
                        maxLines: 2,
                        minFontSize: 8,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText(
                        '${widget.bidModel.carName} (${widget.bidModel.carYear})',
                        maxLines: 1,
                        minFontSize: 8,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: 90.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(6.sp)),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.bold),
                    controller: _priceCont,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintMaxLines: 1,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: greyColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: greyColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: greyColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: greyColor,
                          width: 1.2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      prefixText: '\$ ',
                      prefixStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                      counterText: '',
                      counter: const SizedBox(
                        width: 0,
                        height: 0,
                      ),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: secondaryColor, fontSize: 11.sp),
                      errorStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.red,
                              ),
                    ),
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 4,
                    textInputAction: TextInputAction.done,
                  ),
                )
              ],
            ),
          ),

          /// Body widget
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'partDescriptions'.tr(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: secondaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// Fields and tags
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.verticalSpace,

                      /// Genuine part
                      StatefulBuilder(builder: (context, setState) {
                        return CheckboxWithTitle(
                          title: 'Genuine Part',
                          value: _isGenuine,
                          onChanged: (v) {
                            setState(() {
                              _isGenuine = v;
                            });
                          },
                        );
                      }),

                      4.verticalSpace,

                      /// New/Used part
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            children: [
                              /// New part
                              CheckboxWithTitle(
                                title: 'New Part',
                                value: _isNew,
                                onChanged: (v) {
                                  setState(() {
                                    _isUsed = false;
                                    _isNew = v;
                                  });
                                },
                              ),

                              4.verticalSpace,

                              /// Used part
                              CheckboxWithTitle(
                                title: 'Used Part',
                                value: _isUsed,
                                onChanged: (v) {
                                  setState(() {
                                    _isNew = false;
                                    _isUsed = v;
                                  });
                                },
                              ),

                              4.verticalSpace,

                              /// Used part
                              CheckboxWithTitle(
                                title: 'Include Service',
                                value: _isInclude,
                                onChanged: (v) {
                                  setState(() {
                                    _isInclude = v;
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      8.verticalSpace,
                      Text(
                        'warranty'.tr(),
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,

                      DropDownMainWidget(
                        functionOnTap: (String e) {
                          setState(() {
                            _warrantyValue = e;
                          });
                        },
                        valueSelected: _warrantyValue,
                        options: tData.warrantyDataList,
                      ),
                      24.verticalSpace,

                      /// More details text filed
                      SizedBox(
                        child: AppTextField(
                          controller: _detailsCont,
                          title: 'partDescription'.tr(),
                          hint: 'partDescription'.tr(),
                          hintTextColor: greyColor,
                          maxLines: 8,
                          minLines: 3,
                          maxLength: 700,
                          textInputAction: TextInputAction.done,
                        ),
                      ),

                      24.verticalSpace,

                      /// Add image
                      Text(
                        'Add Images',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                16.verticalSpace,

                /// Images
                SizedBox(
                  height: 105.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          /// Images list
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _pickedImages.length,
                            padding: EdgeInsetsDirectional.only(end: 4.w),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ImageWidget(
                                file: _pickedImages[index].file,
                                onCancel: () {
                                  _pickedImages.removeAt(index);
                                  setState(() {});
                                },
                              );
                            },
                          ),

                          /// Add image
                          Visibility(
                            visible: _pickedImages.length <= 4,
                            child: AddImageWidget(
                              onTap: () =>
                                  _showPickImageDialog(context: context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                32.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 0.5.sw,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: MainButton(
                            title: 'Cancel',
                            onTap: () {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: MainButton(
                            title: 'Confirm',
                            onTap: () {
                              _navigateToSuccessPage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _showPickImageDialog({required BuildContext context}) {
    showImageSourceDialog(
      context: context,
      onCamera: () {
        _pickImg(context: context, source: ImageSource.camera);
      },
      onGallery: () {
        _pickImg(context: context, source: ImageSource.gallery);
      },
    );
  }

  Future<void> _pickImg(
      {required BuildContext context, ImageSource? source}) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: source ?? ImageSource.camera,
      imageQuality: 40,
    );
    if (pickedFile?.path.isNotEmpty ?? false) {
      _pickedImages.add(PickedImageModel(
        index: _pickedImages.length,
        file: File(pickedFile?.path ?? ''),
      ));
      setState(() {});
    }
  }

  void _navigateToSuccessPage() {
    navigate(context: context, page: SuccessPage());
  }
}
