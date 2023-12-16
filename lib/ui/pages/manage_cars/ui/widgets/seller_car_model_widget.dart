import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerCarModelWidget extends StatelessWidget {
  final GetCarsResponseCarModels model;

  const SellerCarModelWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 6.w),
      child: InkWell(
        onTap: model.isSelected ?? false
            ? () {}
            : () => context
                .read<ManageCarsBloc>()
                .add(SelectModel(modelId: model.carModelId ?? 0)),
        borderRadius: BorderRadius.circular(6.r),
        // overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        child: Ink(
          decoration: BoxDecoration(
            color: model.isSelected ?? false
                ? const Color(0xFF1C81F2)
                : primaryColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsetsDirectional.only(
            start: 23.w,
            end: 23.w,
            top: 10.h,
            bottom: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.name ?? '',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
