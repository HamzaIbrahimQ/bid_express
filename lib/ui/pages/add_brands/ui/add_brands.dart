import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/brand_widget.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/no_result.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/search_text_field.dart';
import 'package:bid_express/ui/pages/home/bloc/home_bloc.dart';
import 'package:bid_express/ui/pages/nav_bar/nav_bar.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBrandsPage extends StatefulWidget {
  const AddBrandsPage({super.key});

  @override
  State<AddBrandsPage> createState() => _AddBrandsPageState();
}

class _AddBrandsPageState extends State<AddBrandsPage> with UiUtility {
  late AddBrandsBloc _bloc;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<AddBrandsBloc>();
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Add brands'),
      body: Column(
        children: [
          16.verticalSpace,

          /// Search field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SearchTextField(
              controller: _controller,
              focusNode: _focusNode,
              onChange: (v) => _bloc.add(Search(input: v.trim())),
            ),
          ),

          16.verticalSpace,

          /// Brands list
          BlocConsumer<AddBrandsBloc, AddBrandsState>(
            listener: (context, state) {
              if (state is AddBrandsLoadingState) {
                LoadingView.shared.startLoading(context);
              }

              if (state is AddBrandsSuccessState) {
                LoadingView.shared.stopLoading();
                _goToHomePage();
              }

              if (state is AddBrandsErrorState) {
                LoadingView.shared.stopLoading();
                showErrorToast(context: context, msg: state.error);
              }

              if (state is AddBrandsFailureState) {
                LoadingView.shared.stopLoading();
                showErrorToast(context: context);
              }

              if (state is SearchSuccessState) {}

              if (state is GetBrandsLoadingState) {
                LoadingView.shared.startLoading(context);
              }

              if (state is GetBrandsSuccessState) {
                LoadingView.shared.stopLoading();
              }

              if (state is GetBrandsErrorState) {
                LoadingView.shared.stopLoading();
                showErrorToast(context: context, msg: state.error);
              }

              if (state is GetBrandsFailureState) {
                LoadingView.shared.stopLoading();
                showErrorToast(context: context);
              }
            },
            builder: (context, state) {
              return Expanded(
                child: _controller.text.trim().isNotEmpty &&
                        ((_bloc.searchList?.isEmpty ?? false) ||
                            (_bloc.searchList == null))
                    ? const NoResult()
                    : ListView.builder(
                        padding: EdgeInsetsDirectional.only(
                          start: 24.w,
                          end: 24.w,
                          bottom: 116.h,
                        ),
                        itemCount: (_bloc.searchList != null)
                            ? _bloc.searchList?.length ?? 0
                            : _bloc.brands?.length ?? 0,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: (context, index) {
                          return BrandWidget(
                            brand: (_bloc.searchList != null)
                                ? _bloc.searchList![index]
                                : _bloc.brands?[index] ?? CarBrandResponse(),
                            brands: _bloc.brands ?? [],
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: MainButton(
          title: 'Save',
          onTap: () => _bloc.add(AddBrands()),
        ),
      ),
    );
  }

  void _goToHomePage() {
    navigate(
      context: context,
      isFade: true,
      clearPagesStack: true,
      page: BlocProvider(
        create: (context) => HomeBloc()..add(GetUserData()),
        child: const NavBar(initialIndex: 1),
      )
    );
  }
}
