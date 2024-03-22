import 'package:auto_size_text/auto_size_text.dart';
import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/responses/category/category_response.dart';
import 'package:bid_express/models/responses/selected_category/selected_category.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:bid_express/ui/pages/manage_parts/bloc/manage_parts_bloc.dart';
import 'package:bid_express/ui/pages/manage_parts/ui/manage_parts_page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget with UiUtility {
  final CategoryResponse category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => _goToPartsPage(context),
      onTap: () => context
          .read<ManageCarsBloc>()
          .add(SelectUnSelectCategory(id: category.id ?? 0)),
      borderRadius: BorderRadius.circular(6.r),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 16.w,
          top: 6.h,
          bottom: 13.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: category.isSelected ?? false
              ? Border.all(
            width: 2.w,
            color: primaryColor,
          )
              : Border.all(width: 0, color: Colors.white),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Category image
            SvgPicture.network(
              category.imageUrl ?? '',
              width: 74.w,
              height: 118.h,
              fit: BoxFit.contain,
              placeholderBuilder: (context) {
                return Image.asset(
                  'assets/imgs/oil.png',
                  width: 74.w,
                  height: 100.h,
                  fit: BoxFit.contain,
                );
              },
            ),

            12.verticalSpace,

            Expanded(
              child: AutoSizeText(
                category.nameEn ?? '',
                textAlign: TextAlign.center,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToPartsPage(BuildContext context) {
    navigate(
      context: context,
      page: BlocProvider(
        create: (context) =>
            ManagePartsBloc()..add(GetParts(categoryId: category.id ?? 0)),
        child: ManagePartsPage(
          category: category,
          selectedPartsIds: _getSelectedCategory(context)?.partIdList,
        ),
      ),
    );
  }

  SelectedCategory? _getSelectedCategory(BuildContext context) {
    try {
      return context
          .read<ManageCarsBloc>()
          .selectedCategories
          .firstWhere((element) => element.sellerCategoryId == category.id);
    } catch (e) {
      return null;
    }
  }
}
