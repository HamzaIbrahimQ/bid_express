import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/model_widget.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/no_result.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyModelsTab extends StatefulWidget {
  final CarBrandResponse brand;

  const MyModelsTab({super.key, required this.brand});

  @override
  State<MyModelsTab> createState() => _MyModelsTabState();
}

class _MyModelsTabState extends State<MyModelsTab> with AutomaticKeepAliveClientMixin{
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
    return Column(
      children: [
        /// Search field
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SearchTextField(
            controller: _controller,
            focusNode: _focusNode,
            onChange: (v) => _bloc.add(SearchInMyModels(
              brand: widget.brand,
              input: v.trim(),
            )),
          ),
        ),

        16.verticalSpace,

        /// Brands list
        BlocConsumer<AddBrandsBloc, AddBrandsState>(
          listener: (context, state) {
            if (state is SearchInMyModelsSuccessState) {}
            if (state is SelectUnselectModelSuccessState) {}
          },
          builder: (context, state) {
            return Expanded(
              child: _controller.text.trim().isNotEmpty &&
                      ((widget.brand.myModelsSearchList?.isEmpty ?? false) ||
                          (widget.brand.myModelsSearchList == null))
                  ? const NoResult()
                  : ListView.builder(
                      padding:
                          EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                      itemCount: (widget.brand.myModelsSearchList != null)
                          ? widget.brand.myModelsSearchList?.length ?? 0
                          : widget.brand.myModels?.length ?? 0,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) {
                        return ModelWidget(
                          model: (widget.brand.myModelsSearchList != null)
                              ? widget.brand.myModelsSearchList![index]
                              : widget.brand.myModels![index],
                          isFromMyModels: true,
                          onTap: () => _bloc.add(
                            SelectUnselectModel(
                              brand: widget.brand,
                              id: (widget.brand.myModelsSearchList != null)
                                  ? widget.brand.myModelsSearchList![index].id ?? 0
                                  : widget.brand.myModels![index].id ?? 0,
                            ),
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
