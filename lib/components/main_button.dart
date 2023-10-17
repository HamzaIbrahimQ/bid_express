import 'package:bid_express/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? color;
  final Size? size;
  final TextStyle? textStyle;
  final bool? isHalfScreenWidth;

  const MainButton({
    required this.title,
    required this.onTap,
    this.color,
    this.size,
    this.textStyle,
    this.isHalfScreenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStatePropertyAll(color ?? primaryColor),
            fixedSize: !(isHalfScreenWidth ?? false)
                ? MaterialStatePropertyAll(
                    Size(1.sw, .073.sh),
                  )
                : Theme.of(context).elevatedButtonTheme.style?.fixedSize,
          ),
    );
  }
}
