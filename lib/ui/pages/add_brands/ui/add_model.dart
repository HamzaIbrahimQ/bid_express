import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/available_models_tab.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/my_models_tab.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddModelPage extends StatefulWidget {
  final CarBrandResponse brand;
  final List<CarBrandResponse> brands;

  const AddModelPage({super.key, required this.brand, required this.brands});

  @override
  State<AddModelPage> createState() => _AddModelPageState();
}

class _AddModelPageState extends State<AddModelPage>
    with UiUtility, TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<AddBrandsBloc>().brands = widget.brands;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: widget.brand.nameEn ?? '',
        hasBackIcon: true,
        bottomWidget: TabBar(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          indicatorPadding: EdgeInsets.zero,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          tabAlignment: TabAlignment.center,
          labelPadding: EdgeInsetsDirectional.only(
            start: 40.w,
            end: 40.w,
            bottom: 4.h,
          ),
          indicatorColor: const Color(0XFF0B9CD4),
          labelColor: const Color(0XFF0B9CD4),
          isScrollable: true,
          unselectedLabelColor: blackColor,
          tabs: [
            BlocConsumer<AddBrandsBloc, AddBrandsState>(
              listener: (context, state) {
                if (state is SelectUnselectModelSuccessState) {}

                if (state is GetModelsLoadingState) {
                  LoadingView.shared.startLoading(context);
                }

                if (state is GetModelsSuccessState) {
                  LoadingView.shared.stopLoading();
                }

                if (state is GetModelsErrorState) {
                  LoadingView.shared.stopLoading();
                  showErrorToast(context: context, msg: state.error);
                }

                if (state is GetModelsFailureState) {
                  LoadingView.shared.stopLoading();
                  showErrorToast(context: context);
                }
              },
              builder: (context, state) {
                return Text(
                  'My List (${widget.brand.myModels?.length ?? 0})',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 12.sp,
                  ),
                );
              },
            ),
            Text(
              'Available',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (pop) {
          context.read<AddBrandsBloc>().brands?.firstWhere((element) => element.id == widget.brand.id)
            ?..searchList = null
            ..myModelsSearchList = null;
          return;
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 16.h),
          child: TabBarView(
            controller: _tabController,
            children: [
              MyModelsTab(brand: widget.brand),
              AvailableModelsTab(brand: widget.brand),
            ],
          ),
        ),
      ),
    );
  }
}
