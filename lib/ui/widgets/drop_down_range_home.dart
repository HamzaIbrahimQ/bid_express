import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownMainWidget extends StatelessWidget {
  String valueSelected;

  Function onTap;

  List<String> options;
  final String? hint;

  final double? height;

  DropDownMainWidget({
    super.key,
    required this.onTap,
    required this.valueSelected,
    required this.options,
    this.hint,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      color: Colors.white,
      iconColor: Colors.white,
      surfaceTintColor: Colors.white,
      constraints: BoxConstraints.expand(
        width: 1.sw - 48.w,
        height: height?? .26.sh,
      ),
      position: PopupMenuPosition.under,
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.sp)),
            border: Border.all(color: const Color(0xffC7CBD1), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (valueSelected.isEmpty) ? hint ?? 'Not Selected' : valueSelected,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              ),
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 24.sp,
              color: blackColor,
            )
          ],
        ),
      ),
      itemBuilder: (BuildContext context) {
        return options
            .map((e) => PopupMenuItem(
                  child: Text(
                    e.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () => onTap(e),
                ))
            .toList();
      },
    );
  }
}
