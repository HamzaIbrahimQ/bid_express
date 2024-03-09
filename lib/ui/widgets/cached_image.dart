import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageWidget extends StatelessWidget {
 final double width;
 final double height;
 final String imgPath;
  const CachedImageWidget({super.key ,
  required this.height ,
  required this.width ,
  required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(imageUrl: imgPath ,
          imageBuilder: (context , img, ){
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(12.sp))
                  ,image: DecorationImage(
                  image: img,
                  fit: BoxFit.contain)
              ),
            );
          },
          errorWidget:(context ,erro, widget){
            return Container(
                width: width,
                height: height,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(12.sp))

              ),
            );

          } ,
          placeholder:(context , widget){
            return SizedBox(
              width: width,
              height: height,
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: const Color(0xFFe4edf7),
                child: Text('.'),
              ),
            );;

          }),
    );
  }
}
