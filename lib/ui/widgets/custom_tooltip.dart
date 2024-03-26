import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

class CustomTooltip extends StatelessWidget {
  final TooltipController controller;
  final String title;

  const CustomTooltip({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentDisplayIndex = controller.nextPlayIndex + 1;
    final totalLength = controller.playWidgetLength;
    final hasNextItem = currentDisplayIndex < totalLength;
    final hasPreviousItem = currentDisplayIndex != 1;
    // final canPause = currentDisplayIndex < totalLength;

    return Container(
      width: size.width * .8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Index
          Opacity(
            opacity: totalLength == 1 ? 0 : 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '$currentDisplayIndex OF $totalLength',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),

          12.verticalSpace,

          /// Msg
          AutoSizeText(
            title,
            minFontSize: 9,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),


          16.verticalSpace,

          /// Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Prev
              Opacity(
                opacity: hasPreviousItem ? 1 : 0,
                child: TextButton(
                  onPressed: () {
                    controller.previous();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: disabledColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Prev',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              /// Next
              TextButton(
                onPressed: () {
                  controller.next();
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    hasNextItem ? 'Next' : 'Got It',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
