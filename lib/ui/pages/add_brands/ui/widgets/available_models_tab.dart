import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/models/data_models/cars/model/car_model_model.dart';
import 'package:bid_express/models/responses/car_brand/car_brand_response.dart';
import 'package:bid_express/models/responses/car_model/car_model_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/model_widget.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/no_result.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableModelsTab extends StatefulWidget {
  final CarBrandResponse brand;

  const AvailableModelsTab({super.key, required this.brand});

  @override
  State<AvailableModelsTab> createState() => _AvailableModelsTabState();
}

class _AvailableModelsTabState extends State<AvailableModelsTab>
    with AutomaticKeepAliveClientMixin {

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
    super.build(context);
    return Column(
      children: [
        /// Search field
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SearchTextField(
            controller: _controller,
            focusNode: _focusNode,
            onChange: (v) => context.read<AddBrandsBloc>().add(SearchForModel(
              brand: widget.brand,
              input: v.trim(),
            )),
          ),
        ),

        16.verticalSpace,

        /// Brands list
        BlocConsumer<AddBrandsBloc, AddBrandsState>(
          listener: (context, state) {
            if (state is SearchForModelSuccessState) {}
            if (state is SelectUnselectModelSuccessState) {}
          },
          builder: (context, state) {
            return Expanded(
              child: _controller.text.trim().isNotEmpty &&
                      ((widget.brand.searchList?.isEmpty ?? false) ||
                          (widget.brand.searchList == null))
                  ? const NoResult()
                  : ListView.builder(
                      padding:
                          EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                      itemCount: (widget.brand.searchList != null)
                          ? widget.brand.searchList?.length ?? 0
                          : widget.brand.models?.length ?? 0,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) {
                        return ModelWidget(
                          model: (widget.brand.searchList != null)
                              ? widget.brand.searchList![index]
                              : widget.brand.models?[index] ?? CarModelResponse(),
                          onTap: () => context.read<AddBrandsBloc>().add(
                            SelectUnselectModel(
                              brand: widget.brand,
                              id: (widget.brand.searchList != null)
                                  ? widget.brand.searchList![index].id ?? 0
                                  : widget.brand.models?[index].id ?? 0,
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
