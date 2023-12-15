import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/add_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandWidget extends StatelessWidget {
  final CarBrandResponse brand;
  final List<CarBrandResponse> brands;

  const BrandWidget({super.key, required this.brand, required this.brands});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBrandsBloc, AddBrandsState>(
      listener: (context, state) {
        if (state is SelectUnselectModelSuccessState) {
          print('sdafasd');
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () => _onTap(context),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          borderRadius: BorderRadius.circular(4.r),
          child: Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsetsDirectional.only(
              top: 28.h,
              bottom: 28.h,
              start: 12.w,
              end: 6.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
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
              children: [
                /// Image and name
                Row(
                  children: [
                    /// Image
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F6FB),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 8.h,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: brand.imageUrl ?? '',
                          width: 28.w,
                          height: 28.h,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return SvgPicture.asset(
                              'assets/imgs/logo.svg',
                              width: 28.w,
                              height: 28.h,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),

                    12.horizontalSpace,

                    /// Name
                    Text(
                      brand.nameEn ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                /// Add icon
                if (brand.myModels?.isNotEmpty ?? false)
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 12.w),
                    child: Text(
                      '(' +
                          (brand.myModels?.length.toString() ?? '') +
                          ')' +
                          ' ' +
                          'Selected',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                else
                  IconButton(
                    onPressed: () => _onTap(context),
                    padding: EdgeInsets.zero,
                    color: primaryColor,
                    icon: SvgPicture.asset(
                      'assets/icons/add.svg',
                      width: 22.w,
                      height: 22.h,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onTap(BuildContext context) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => (brand.models?.isNotEmpty ?? false)
              ? (AddBrandsBloc())
              : (AddBrandsBloc()..add(GetModels(brandId: brand.id ?? 0))),
          child: AddModelPage(
            brand: brand,
            brands: brands,
          ),
        ),
      ),
    )
        .then((value) {
      context.read<AddBrandsBloc>().add(SelectUnselectModelSuccess());
    });
  }
}
